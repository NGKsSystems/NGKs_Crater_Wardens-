extends "res://scripts/hazards/hazard_base.gd"

class_name Mine

# ============================================================
# mine.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 3: Hazards
# ============================================================
# Ground-level mine hazard.
# Touching the mine kills the rover instantly.
# All kill logic is in HazardBase._on_body_entered().
#
# Placement:  center on ground surface — radius 14, so sit at
#             ground_surface_y - 14 (top of mine flush with ground).
# ============================================================
