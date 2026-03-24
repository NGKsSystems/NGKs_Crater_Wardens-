extends Node2D

@export var bob_amount: float = 1.5
@export var bob_speed: float = 6.0
@export var visor_pulse_speed: float = 2.4
@export var visor_min_alpha: float = 0.72
@export var visor_max_alpha: float = 1.0

@onready var _body_anchor: Node2D = $BodyAnchor
@onready var _visor: Polygon2D = $BodyAnchor/Helmet/Visor
@onready var _blaster_glow: Polygon2D = $BodyAnchor/Blaster/BlasterGlow
@onready var _arm_l: Polygon2D = $BodyAnchor/ArmL
@onready var _arm_r: Polygon2D = $BodyAnchor/ArmR

var _t: float = 0.0
var _base_y: float = 0.0

func _ready() -> void:
	_base_y = _body_anchor.position.y

func _process(delta: float) -> void:
	_t += delta
	_body_anchor.position.y = _base_y + sin(_t * bob_speed) * bob_amount
	
	var pulse := remap(sin(_t * visor_pulse_speed), -1.0, 1.0, visor_min_alpha, visor_max_alpha)
	var visor_color := _visor.color
	visor_color.a = pulse
	_visor.color = visor_color
	
	var glow_color := _blaster_glow.color
	glow_color.a = pulse * 0.9
	_blaster_glow.color = glow_color
	
	_arm_l.rotation = deg_to_rad(-4.0 + sin(_t * 5.0) * 2.0)
	_arm_r.rotation = deg_to_rad(4.0 - sin(_t * 5.0) * 2.0)