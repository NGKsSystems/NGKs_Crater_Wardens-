extends ParallaxBackground

@export var camera_path: NodePath
@export var lock_vertical_scroll: bool = true
@export var vertical_anchor: float = 0.0
@export var subtle_drift_speed: float = 2.0

var _camera: Camera2D
var _base_offset_x: float = 0.0

func _ready() -> void:
	if camera_path != NodePath():
		_camera = get_node_or_null(camera_path) as Camera2D

func _process(delta: float) -> void:
	if _camera != null:
		scroll_offset.x = _camera.global_position.x
		if lock_vertical_scroll:
			scroll_offset.y = vertical_anchor
		else:
			scroll_offset.y = _camera.global_position.y * 0.05
	else:
		_base_offset_x += subtle_drift_speed * delta
		scroll_offset.x = _base_offset_x
		if lock_vertical_scroll:
			scroll_offset.y = vertical_anchor