extends "res://scripts/enemies/enemy_base.gd"

# ============================================================
# drone_flyer.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 4: Enemies
# ============================================================
# Aerial enemy positioned above the rover's travel lane.
# Oscillates vertically — requires UPWARD shot (X key) to destroy.
# Placed at y~380 (rover runs at y~524) so it does NOT kill by
# contact at ceiling height; it is a pure shooting target.
#
# NOT in scope: pathfinding, projectile firing, audio
# ============================================================

@export var oscillate_speed: float = 1.8   # rad/s — full sine cycle ≈ 3.5 s
@export var oscillate_amp: float   = 30.0  # px amplitude around spawn y

var _base_y: float = 0.0
var _phase: float  = 0.0


func _ready() -> void:
	super._ready()
	_base_y = position.y   # capture static placement y as center of oscillation


func _process(delta: float) -> void:
	if not _active:
		return
	_phase     += oscillate_speed * delta
	position.y  = _base_y + sin(_phase) * oscillate_amp
