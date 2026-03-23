extends Node

# PerformanceManager — controls low-spec mode settings globally

var low_spec_mode: bool = false
var target_fps: int = 60
var screen_shake_enabled: bool = true
var particles_enabled: bool = true
var background_layers: int = 3

signal performance_mode_changed(is_low_spec)

func _ready() -> void:
	_apply_settings()

func set_low_spec_mode(enabled: bool) -> void:
	low_spec_mode = enabled
	if enabled:
		target_fps = 30
		screen_shake_enabled = false
		particles_enabled = false
		background_layers = 2
	else:
		target_fps = 60
		screen_shake_enabled = true
		particles_enabled = true
		background_layers = 3
	_apply_settings()
	emit_signal("performance_mode_changed", enabled)

func _apply_settings() -> void:
	Engine.target_fps = target_fps
