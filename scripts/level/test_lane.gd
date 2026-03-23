extends Node2D

# test_lane.gd — Phase 1 dev-only test level (Godot 4)

func _ready() -> void:
	print("[TestLane] Phase 1 — Rover Movement Prototype")
	print("[TestLane] R = restart  |  Esc = quit")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		match event.physical_keycode:
			KEY_R:
				get_tree().reload_current_scene()
			KEY_ESCAPE:
				get_tree().quit()

