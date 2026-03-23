extends "res://scripts/enemies/enemy_base.gd"

# ============================================================
# ground_turret.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 4: Enemies
# ============================================================
# Static ground threat — planted on the terrain surface.
# Does not move horizontally; a light vertical bob keeps it alive-
# looking without physics cost.
# Requires FORWARD shot (Z key) to destroy; kills rover on contact.
#
# Hit points = 2 to require two hits — rewards sustained fire.
#
# NOT in scope: projectile firing, turret rotation, audio
# ============================================================

@export var bob_amp: float   = 4.0    # px — gentle bob
@export var bob_speed: float = 1.2    # rad/s

var _base_y: float = 0.0
var _phase: float  = 0.0


func _ready() -> void:
	super._ready()
	_base_y = position.y


func _process(delta: float) -> void:
	if not _active:
		return
	_phase     += bob_speed * delta
	position.y  = _base_y + sin(_phase) * bob_amp
