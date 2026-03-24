extends Node2D

# test_lane.gd — Phase 6: UI / Score / HUD (Godot 4)
# Controls: Space=jump | Z=fire_forward | X=fire_up | R=restart | Esc=quit
# Checkpoint signals wire to _on_checkpoint_reached → StageController.on_checkpoint()
# Finish trigger body_entered wires to _on_finish_entered → StageController.on_finish()

@onready var _stage: Node         = $StageController
@onready var _hud:   CanvasLayer  = $HUD


func _ready() -> void:
	ScoreManager.reset()
	_stage.stage_complete_announced.connect(_on_stage_complete)
	print("[TestLane] Phase 6 — UI/Score/HUD | R=restart | Esc=quit")
	print("[TestLane] Hazards: crater gap x2 | mine | rock obstacle")
	print("[TestLane] Enemies: drone flyer | hover attacker | ground turret")
	print("[TestLane] Checkpoints: CP1 x=500 | CP2 x=2700 | CP3 x=4200 | Finish x=5600")


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		match event.physical_keycode:
			KEY_R:
				get_tree().reload_current_scene()
			KEY_ESCAPE:
				get_tree().quit()


# Connected from all hazard and enemy Area2D nodes via .tscn [connection] entries.
func _on_hazard_triggered() -> void:
	print("[TestLane] DEAD — restarting")
	get_tree().call_deferred("reload_current_scene")


# Connected from CP1, CP2, CP3 checkpoint_reached(index) signal.
func _on_checkpoint_reached(index: int) -> void:
	_stage.on_checkpoint(index)
	ScoreManager.add_checkpoint_score(100)
	_hud.update_checkpoint(_stage.cleared, _stage.total_checkpoints)


# Connected from FinishTrigger body_entered signal.
func _on_finish_entered(body: Node) -> void:
	if not body is CharacterBody2D:
		return
	_stage.on_finish()


# Connected programmatically in _ready() to StageController.stage_complete_announced.
# Phase 10.1: await-based delay — avoids silent Callable-connect failure.
func _on_stage_complete() -> void:
	ScoreManager.add_stage_clear_bonus(500)
	_hud.show_state("STAGE COMPLETE!")
	print("[TestLane] stage complete — waiting 1 s then advancing level")
	await get_tree().create_timer(1.0).timeout
	print("[TestLane] timer done — calling LevelFlowManager.load_next_level()")
	LevelFlowManager.load_next_level()

