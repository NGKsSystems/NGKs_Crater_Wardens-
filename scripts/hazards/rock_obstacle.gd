extends HazardBase

class_name RockObstacle

# ============================================================
# rock_obstacle.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 3: Hazards
# ============================================================
# Rock obstacle in the lane — rover must jump over it.
# Contact (Area2D overlap) kills the rover instantly.
# All kill logic is in HazardBase._on_body_entered().
#
# Placement:  bottom of rock flush with ground surface.
#             center_y = ground_surface_y - (shape_half_height)
# ============================================================
