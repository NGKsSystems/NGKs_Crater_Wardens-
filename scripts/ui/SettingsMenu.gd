extends Control

const SAVE_PATH = "user://settings.cfg"

onready var chk_low_spec = $VBox/ChkLowSpec
onready var chk_fullscreen = $VBox/ChkFullscreen
onready var chk_screen_shake = $VBox/ChkScreenShake
onready var slider_volume = $VBox/SliderVolume
onready var btn_back = $VBox/BtnBack

func _ready() -> void:
	_load_settings()
	btn_back.grab_focus()
	chk_low_spec.connect("toggled", self, "_on_low_spec_toggled")
	chk_fullscreen.connect("toggled", self, "_on_fullscreen_toggled")
	chk_screen_shake.connect("toggled", self, "_on_screen_shake_toggled")
	slider_volume.connect("value_changed", self, "_on_volume_changed")
	btn_back.connect("pressed", self, "_on_back")

func _on_low_spec_toggled(pressed: bool) -> void:
	PerformanceManager.set_low_spec_mode(pressed)
	_save_settings()

func _on_fullscreen_toggled(pressed: bool) -> void:
	OS.window_fullscreen = pressed
	_save_settings()

func _on_screen_shake_toggled(pressed: bool) -> void:
	PerformanceManager.screen_shake_enabled = pressed
	_save_settings()

func _on_volume_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear2db(value))
	_save_settings()

func _on_back() -> void:
	get_tree().change_scene("res://scenes/ui/main_menu.tscn")

func _save_settings() -> void:
	var cfg = ConfigFile.new()
	cfg.set_value("performance", "low_spec", chk_low_spec.pressed)
	cfg.set_value("display", "fullscreen", chk_fullscreen.pressed)
	cfg.set_value("gameplay", "screen_shake", chk_screen_shake.pressed)
	cfg.set_value("audio", "volume", slider_volume.value)
	cfg.save(SAVE_PATH)

func _load_settings() -> void:
	var cfg = ConfigFile.new()
	if cfg.load(SAVE_PATH) != OK:
		return
	chk_low_spec.pressed = cfg.get_value("performance", "low_spec", false)
	chk_fullscreen.pressed = cfg.get_value("display", "fullscreen", false)
	chk_screen_shake.pressed = cfg.get_value("gameplay", "screen_shake", true)
	slider_volume.value = cfg.get_value("audio", "volume", 1.0)
	PerformanceManager.set_low_spec_mode(chk_low_spec.pressed)
	OS.window_fullscreen = chk_fullscreen.pressed
	PerformanceManager.screen_shake_enabled = chk_screen_shake.pressed
	AudioServer.set_bus_volume_db(0, linear2db(slider_volume.value))
