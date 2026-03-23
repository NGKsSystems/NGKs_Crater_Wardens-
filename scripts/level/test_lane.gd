extends Node2D

# test_lane.gd — Phase 5: Stage Structure (Godot 4)
# Controls: Space=jump | Z=fire_forward | X=fire_up | R=restart | Esc=quit
# Checkpoint signals wire to _on_checkpoint_reached → StageController.on_checkpoint()
# Finish trigger body_entered wires to _on_finish_entered → StageController.on_finish()

@onready var _stage: Node = $StageController


func _ready() -> void:
	print("[TestLane] Phase 5 — Stage Structure | R=restart | Esc=quit")
	print("[TestLane] Hazards: crater gap x2 | mine | rock obstacle")
	print("[TestLane] Enemies: drone flyer (X) | hover attacker (Z) | ground turret (Zx2)")
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


# Connected from FinishTrigger body_entered signal.
func _on_finish_entered(body: Node) -> void:
	if not body is CharacterBody2D:
		return
	_stage.on_finish()

