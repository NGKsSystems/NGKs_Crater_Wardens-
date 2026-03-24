extends Node

# ============================================================
# VfxManager.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 7: VFX / Audio Polish
# ============================================================
# Responsibilities:
#   - Pre-allocate two CPUParticles2D pools (small + large)
#   - Spawn one-shot particle bursts at world positions
#   - GL Compatibility safe — no shaders, no GPU particles
#
# Pool sizes: 4 small slots (impact/poof) + 4 large slots (explode/checkpoint)
# Max particles per burst: small=6, large=14
# All effects: one_shot=true, lifetime <= 0.5s
# No per-call allocation — only value assignments on pooled nodes
# ============================================================

const _SMALL_COUNT : int = 4   # projectile impact, rover poof
const _LARGE_COUNT : int = 4   # enemy explosion, checkpoint flash

var _small     : Array = []    # Array[CPUParticles2D]
var _large     : Array = []    # Array[CPUParticles2D]
var _small_idx : int   = 0
var _large_idx : int   = 0


func _ready() -> void:
	for i in _SMALL_COUNT:
		_small.append(_make_pool_node(6, 0.3))
	for i in _LARGE_COUNT:
		_large.append(_make_pool_node(14, 0.5))


func _make_pool_node(amount: int, lifetime: float) -> CPUParticles2D:
	var p := CPUParticles2D.new()
	p.emitting                = false
	p.one_shot                = true
	p.explosiveness           = 1.0
	p.amount                  = amount
	p.lifetime                = lifetime
	p.spread                  = 180.0
	p.gravity                 = Vector2(0.0, 220.0)
	p.initial_velocity_min    = 60.0
	p.initial_velocity_max    = 160.0
	p.scale_amount_min        = 3.0
	p.scale_amount_max        = 8.0
	p.color                   = Color.WHITE
	add_child(p)
	return p


func _get_small() -> CPUParticles2D:
	var p : CPUParticles2D = _small[_small_idx]
	_small_idx = (_small_idx + 1) % _SMALL_COUNT
	return p


func _get_large() -> CPUParticles2D:
	var p : CPUParticles2D = _large[_large_idx]
	_large_idx = (_large_idx + 1) % _LARGE_COUNT
	return p


# Small orange flash — projectile hits enemy
func spawn_impact(pos: Vector2) -> void:
	var p := _get_small()
	p.global_position      = pos
        p.color                = Color(1.0, 0.78, 0.15, 1.0)
        p.initial_velocity_min = 90.0
        p.initial_velocity_max = 220.0
func spawn_poof(pos: Vector2) -> void:
	var p := _get_small()
	p.global_position      = pos
	p.color                = Color(0.7, 0.65, 0.55, 0.85)
	p.initial_velocity_min = 30.0
	p.initial_velocity_max = 90.0
	p.restart()


# Large orange/red burst — enemy death
func spawn_explode(pos: Vector2) -> void:
	var p := _get_large()
	p.global_position      = pos
        p.color                = Color(1.0, 0.48, 0.05, 1.0)
        p.initial_velocity_min = 120.0
        p.initial_velocity_max = 320.0
func spawn_checkpoint(pos: Vector2) -> void:
	var p := _get_large()
	p.global_position      = pos
        p.color                = Color(0.0, 0.95, 1.0, 1.0)
        p.initial_velocity_min = 70.0
        p.initial_velocity_max = 180.0
