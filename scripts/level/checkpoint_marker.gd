extends Area2D

# ============================================================
# checkpoint_marker.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 5: Stage Structure
# ============================================================
# Responsibilities:
#   - Detect rover body entry via body_entered
#   - Fire once only — _triggered guard prevents re-fire on reload
#   - Emit checkpoint_reached(index) for stage_controller to consume
#
# NOT in scope: score, respawn, save/load, UI popups
# Placement: static in test_lane.tscn
# Reset: scene reload destroys and re-creates this node — _triggered
#        resets automatically with no extra code required
# ============================================================

signal checkpoint_reached(index: int)

@export var checkpoint_index: int  = 1
@export var checkpoint_name: String = ""

var _triggered: bool = false

@onready var _label: Label = $Label


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	var display: String = checkpoint_name if checkpoint_name != "" else ("CP%d" % checkpoint_index)
	if _label != null:
		_label.text = display


func _on_body_entered(body: Node) -> void:
	if _triggered:
		return
	if not body is CharacterBody2D:
		return
	_triggered = true
	VfxManager.spawn_checkpoint(global_position)
	AudioManager.play_checkpoint()
	checkpoint_reached.emit(checkpoint_index)
	print("[CP%d] reached" % checkpoint_index)
