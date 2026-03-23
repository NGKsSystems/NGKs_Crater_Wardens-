extends Node

# ScoreManager — tracks score across the session

var score: int = 0
var checkpoint_count: int = 0
var distance: float = 0.0

signal score_changed(new_score)

func _ready() -> void:
	reset()

func reset() -> void:
	score = 0
	checkpoint_count = 0
	distance = 0.0
	emit_signal("score_changed", score)

func add_enemy_score(value: int) -> void:
	score += value
	emit_signal("score_changed", score)

func add_checkpoint_score(value: int) -> void:
	score += value
	checkpoint_count += 1
	emit_signal("score_changed", score)

func add_distance_score(delta_distance: float) -> void:
	# Called each physics frame with rover travel delta — accumulate
	distance += delta_distance
	var dist_points = int(distance / 10.0)
	if dist_points > 0:
		score += dist_points
		distance = fmod(distance, 10.0)
		emit_signal("score_changed", score)

func add_stage_clear_bonus(value: int) -> void:
	score += value
	emit_signal("score_changed", score)

func get_score() -> int:
	return score
