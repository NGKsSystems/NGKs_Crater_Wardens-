extends Node2D

# test_lane.gd — Phase 3: Hazards prototype lane (Godot 4)
# Controls: Space=jump | Z=fire_forward | X=fire_up | R=restart | Esc=quit
# Hazard signal handler: _on_hazard_triggered — instant reload on kill

func _ready() -> void:
	print("[TestLane] Phase 3 — Hazards | R=restart | Esc=quit")
	print("[TestLane] Hazards: crater gap x2 | mine | rock obstacle")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		match event.physical_keycode:
			KEY_R:
				get_tree().reload_current_scene()
			KEY_ESCAPE:
				get_tree().quit()

# Connected from all hazard Area2D nodes via .tscn [connection] entries.
func _on_hazard_triggered() -> void:
	print("[TestLane] DEAD — restarting")
	get_tree().call_deferred("reload_current_scene")

