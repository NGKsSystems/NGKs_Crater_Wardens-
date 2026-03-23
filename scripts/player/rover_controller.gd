extends CharacterBody2D

# ============================================================
# rover_controller.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase: Rover Movement Prototype
# ============================================================
# Responsibilities:
#   - Auto-forward movement (constant rightward velocity)
#   - Gravity with is_on_floor() ground detection
#   - Short jump  : tap `jump` — velocity cut on release
#   - Long jump   : hold `jump` — reduced gravity during ascent
#   - Landing     : emits `landed` signal on touchdown
#
# NOT in scope: shooting, damage, enemies, score, effects
# NO per-frame allocations
# ============================================================

@export var move_speed: float             = 240.0
@export var gravity_strength: float       = 900.0
@export var jump_force: float             = 520.0
@export var jump_hold_gravity_scale: float = 0.38
@export var jump_hold_max_time: float     = 0.22
@export var jump_cut_velocity: float      = 260.0
@export var max_fall_speed: float         = 900.0

var _jump_held: bool        = false
var _jump_hold_timer: float = 0.0
var _was_on_floor: bool     = true

@onready var _weapon: Node = $RoverWeapon

signal landed
signal jumped_short
signal jumped_long


func _physics_process(delta: float) -> void:
	var on_floor: bool = is_on_floor()

	# Landing event
	if on_floor and not _was_on_floor:
		landed.emit()
	_was_on_floor = on_floor

	# Gravity
	if on_floor:
		if velocity.y > 0.0:
			velocity.y = 0.0
	else:
		var grav_mult: float = jump_hold_gravity_scale \
			if (_jump_held and _jump_hold_timer < jump_hold_max_time) \
			else 1.0
		velocity.y += gravity_strength * grav_mult * delta
		if velocity.y > max_fall_speed:
			velocity.y = max_fall_speed

	# Jump start
	if Input.is_action_just_pressed("jump") and on_floor:
		velocity.y    = -jump_force
		_jump_held    = true
		_jump_hold_timer = 0.0

	# Jump hold
	if _jump_held:
		if Input.is_action_pressed("jump") and _jump_hold_timer < jump_hold_max_time:
			_jump_hold_timer += delta
			if _jump_hold_timer >= jump_hold_max_time:
				_commit_long_jump()
		else:
			_cut_jump()

	# Auto-forward
	velocity.x = move_speed

	move_and_slide()

	# Weapon — tick cooldowns and handle fire inputs (hold to sustain fire rate)
	_weapon.tick(delta)
	if Input.is_action_pressed("fire_forward"):
		_weapon.try_fire_forward()
	if Input.is_action_pressed("fire_up"):
		_weapon.try_fire_up()


func _cut_jump() -> void:
	if velocity.y < -jump_cut_velocity:
		velocity.y = -jump_cut_velocity
	_jump_held = false
	jumped_short.emit()


func _commit_long_jump() -> void:
	_jump_held = false
	jumped_long.emit()

