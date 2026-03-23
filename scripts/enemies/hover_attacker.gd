extends "res://scripts/enemies/enemy_base.gd"

# ============================================================
# hover_attacker.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 4: Enemies
# ============================================================
# Forward-lane threat positioned at rover height.
# Hovers with a slow leftward drift — rover approaches and must
# destroy it with FORWARD shot (Z key) or die on contact.
#
# Drift is kept slow (-25 px/s) so the enemy stays well within
# the GroundRight2 segment and never drifts into a gap.
#
# NOT in scope: projectile firing, pathfinding, audio
# ============================================================

@export var drift_speed: float  = -25.0   # px/s — slow left drift
@export var hover_amp: float    = 12.0    # px — vertical bob amplitude
@export var hover_speed: float  = 2.5     # rad/s

var _base_y: float = 0.0
var _phase: float  = 0.0


func _ready() -> void:
	super._ready()
	_base_y = position.y


func _process(delta: float) -> void:
	if not _active:
		return
	_phase     += hover_speed * delta
	position.x += drift_speed * delta
	position.y  = _base_y + sin(_phase) * hover_amp
