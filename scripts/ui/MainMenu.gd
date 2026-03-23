extends Control

@onready var btn_play     = $VBox/BtnPlay
@onready var btn_settings = $VBox/BtnSettings
@onready var btn_quit     = $VBox/BtnQuit

func _ready() -> void:
	btn_play.grab_focus()
	btn_play.pressed.connect(_on_play)
	btn_settings.pressed.connect(_on_settings)
	btn_quit.pressed.connect(_on_quit)

func _on_play() -> void:
	get_tree().change_scene_to_file("res://scenes/root/game_root.tscn")

func _on_settings() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/settings_menu.tscn")

func _on_quit() -> void:
	get_tree().quit()

