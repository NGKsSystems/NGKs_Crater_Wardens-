extends Node

# GameRoot — entry point for active gameplay session

func _ready() -> void:
	GameStateManager.change_state(GameStateManager.State.PLAYING)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		GameStateManager.request_pause()
