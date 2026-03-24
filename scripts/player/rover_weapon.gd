extends Node

# ============================================================
# rover_weapon.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 2: Shooting Prototype
# ============================================================
# Responsibilities:
#   - Register projectile pools on ready (no instantiate() in gameplay)
#   - Enforce per-weapon fire cooldowns
#   - Retrieve projectile from ObjectPoolManager and activate it
#
# NOT in scope: damage, hit effects, enemy interaction, audio
# No per-frame allocations inside fire paths
# Called from rover_controller.gd _physics_process
# ============================================================

const _SCENE_FWD: PackedScene = preload("res://scenes/player/projectile_forward.tscn")
const _SCENE_UP:  PackedScene = preload("res://scenes/player/projectile_up.tscn")

@export var cooldown_forward: float = 0.18   # s — forward fire rate limit
@export var cooldown_up: float      = 0.22   # s — upward fire rate limit
@export var speed_forward: float    = 620.0  # px/s rightward
@export var speed_up: float         = 520.0  # px/s upward
@export var lifetime_forward: float = 1.4    # s before auto-return to pool
@export var lifetime_up: float      = 1.2    # s before auto-return to pool

# Timers count DOWN from cooldown value to 0 — fire allowed when <= 0
var _timer_fwd: float = 0.0
var _timer_up: float  = 0.0

@onready var _muzzle_fwd: Marker2D = $MuzzleForward
@onready var _muzzle_up:  Marker2D = $MuzzleUp


func _ready() -> void:
	# Pre-fill the pools — no instantiate() will occur during normal gameplay
	ObjectPoolManager.register_pool("projectile_forward", _SCENE_FWD, 12)
	ObjectPoolManager.register_pool("projectile_up",      _SCENE_UP,   8)
	print("[Weapon] pools registered — fwd:12 up:8")


# Called every physics frame by rover_controller.gd — decrements cooldown timers.
func tick(delta: float) -> void:
	if _timer_fwd > 0.0:
		_timer_fwd -= delta
	if _timer_up > 0.0:
		_timer_up -= delta


# Attempt to fire a forward projectile — silently blocked if on cooldown.
func try_fire_forward() -> void:
	if _timer_fwd > 0.0:
		return
	print("[Weapon] fire_forward")
	AudioManager.play_fire()
	_fire("projectile_forward", _SCENE_FWD, Vector2(speed_forward, 0.0), lifetime_forward, _muzzle_fwd)
	_timer_fwd = cooldown_forward


# Attempt to fire an upward projectile — silently blocked if on cooldown.
func try_fire_up() -> void:
	if _timer_up > 0.0:
		return
	print("[Weapon] fire_up")
	AudioManager.play_fire()
	_fire("projectile_up", _SCENE_UP, Vector2(0.0, -speed_up), lifetime_up, _muzzle_up)
	_timer_up = cooldown_up


func _fire(key: String, fallback_scene: PackedScene, vel: Vector2, life: float, muzzle: Marker2D) -> void:
	if muzzle == null:
		push_error("[Weapon] muzzle null — check MuzzleForward/MuzzleUp in rover.tscn")
		return
	# RoverWeapon is a plain Node (no 2D transform), so muzzle.global_position equals its
	# local offset only. Compute true world spawn position via the rover (CharacterBody2D) parent.
	var spawn_pos: Vector2 = get_parent().global_position + muzzle.position
	var proj: Node = ObjectPoolManager.get_object(key)
	if proj == null:
		push_warning("[Weapon] pool '%s' null — emergency instantiate" % key)
		proj = fallback_scene.instantiate()
		proj.set_meta("pool_key", key)
		ObjectPoolManager.add_child(proj)
	proj.activate(spawn_pos, vel, life)
	print("[Weapon] spawned %s pos=%s" % [key, str(spawn_pos)])
