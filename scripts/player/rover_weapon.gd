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
	# Pre-fill the pools — no instantiate() will occur during gameplay
	ObjectPoolManager.register_pool("projectile_forward", _SCENE_FWD, 12)
	ObjectPoolManager.register_pool("projectile_up",      _SCENE_UP,   8)


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
	_fire("projectile_forward", Vector2(speed_forward, 0.0), lifetime_forward, _muzzle_fwd)
	_timer_fwd = cooldown_forward


# Attempt to fire an upward projectile — silently blocked if on cooldown.
func try_fire_up() -> void:
	if _timer_up > 0.0:
		return
	_fire("projectile_up", Vector2(0.0, -speed_up), lifetime_up, _muzzle_up)
	_timer_up = cooldown_up


func _fire(key: String, vel: Vector2, life: float, muzzle: Marker2D) -> void:
	var proj = ObjectPoolManager.get_object(key)
	if proj == null:
		return
	proj.activate(muzzle.global_position, vel, life)
