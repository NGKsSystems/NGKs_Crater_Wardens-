extends Node

# GameStateManager — controls top-level game flow
# States: MENU, PLAYING, PAUSED, DEAD, GAME_OVER, STAGE_CLEAR

enum State { MENU, PLAYING, PAUSED, DEAD, GAME_OVER, STAGE_CLEAR }

var current_state: int = State.MENU

signal state_changed(new_state)

func _ready() -> void:
	set_process(false)

func change_state(new_state: int) -> void:
	current_state = new_state
	state_changed.emit(new_state)

func is_playing() -> bool:
	return current_state == State.PLAYING

func request_pause() -> void:
	if current_state == State.PLAYING:
		change_state(State.PAUSED)
		get_tree().paused = true

func request_resume() -> void:
	if current_state == State.PAUSED:
		change_state(State.PLAYING)
		get_tree().paused = false

func request_restart() -> void:
	get_tree().paused = false
	change_state(State.PLAYING)
	get_tree().reload_current_scene()
