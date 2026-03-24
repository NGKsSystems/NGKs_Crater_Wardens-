extends Control

@onready var btn_resume    = $VBox/BtnResume
@onready var btn_settings  = $VBox/BtnSettings
@onready var btn_main_menu = $VBox/BtnMainMenu

func _ready() -> void:
	btn_resume.grab_focus()
	btn_resume.pressed.connect(_on_resume)
	btn_settings.pressed.connect(_on_settings)
	btn_main_menu.pressed.connect(_on_main_menu)
	GameStateManager.state_changed.connect(_on_state_changed)

func _on_state_changed(new_state: int) -> void:
	visible = (new_state == GameStateManager.State.PAUSED)
	if visible:
		btn_resume.grab_focus()

func _on_resume() -> void:
	GameStateManager.request_resume()

func _on_settings() -> void:
	GameStateManager.settings_back_target = "res://scenes/level/test_lane.tscn"
	get_tree().change_scene_to_file("res://scenes/ui/settings_menu.tscn")

func _on_main_menu() -> void:
	GameStateManager.request_resume()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

