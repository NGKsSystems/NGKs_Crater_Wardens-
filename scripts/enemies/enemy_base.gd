extends Area2D

# ============================================================
# enemy_base.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 4: Enemies
# ============================================================
# Base class for all enemy types.
#
# Responsibilities:
#   - Detect projectile hits via area_entered (projectiles carry pool_key meta)
#   - Detect rover contact via body_entered (CharacterBody2D = rover)
#   - Emit player_killed signal on rover contact → same flow as hazards
#   - Consume hitting projectile back to pool on impact
#   - Subclass movement logic lives in drone_flyer / hover_attacker / ground_turret
#
# NOT in scope: score, pickups, audio, VFX, advanced AI, loot
# Placement: static in test_lane.tscn for Phase 4
# Pooling: designed for future SpawnManager pooling (activate/deactivate)
# ============================================================

signal player_killed

@export var hit_points:   int = 1
@export var score_value:  int = 50

var _hp: int       = 1
var _active: bool  = true   # true on scene load; false after death


func _ready() -> void:
	_hp = hit_points
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)


# Called when an Area2D enters this enemy's collision shape.
# Only reacts to nodes carrying pool_key meta (i.e. projectiles).
func _on_area_entered(area: Area2D) -> void:
	if not _active:
		return
	if not area.has_meta("pool_key"):
		return
	VfxManager.spawn_impact(area.global_position)
	AudioManager.play_hit()
	_consume_projectile(area)
	_hp -= 1
	if _hp <= 0:
		_on_hit()


# Called when a physics body enters this enemy's collision shape.
# Only the rover (CharacterBody2D) triggers the kill signal.
func _on_body_entered(body: Node) -> void:
	if not _active:
		return
	if body is CharacterBody2D:
		player_killed.emit()


# Return the hitting projectile to its pool so it disappears cleanly.
func _consume_projectile(proj: Area2D) -> void:
	var key: String = proj.get_meta("pool_key", "")
	if key != "":
		ObjectPoolManager.return_object(key, proj)
	else:
		proj.hide()


# Called when HP reaches 0. Subclasses may override for FX.
func _on_hit() -> void:
	_active = false
	VfxManager.spawn_explode(global_position)
	AudioManager.play_explode()
	hide()
	ScoreManager.add_enemy_score(score_value)
