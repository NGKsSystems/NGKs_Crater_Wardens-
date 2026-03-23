extends Resource

class_name RoverData

# ============================================================
# RoverData.gd — NGKs Crater Wardens V1
# Tuning resource for rover movement parameters
# Edit values in this file OR create a .tres instance and
# override per-level via the inspector
# ============================================================

@export var move_speed: float              = 240.0   # px / s auto-forward
@export var gravity: float                 = 900.0   # px / s² downward
@export var jump_force: float              = 520.0   # initial upward velocity
@export var jump_hold_gravity_scale: float = 0.38   # gravity % while holding jump
@export var jump_hold_max_time: float      = 0.22   # max sec gravity is reduced
@export var jump_cut_velocity: float       = 260.0  # upward vel cap on early release
@export var max_fall_speed: float          = 900.0  # terminal fall velocity
