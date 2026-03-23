extends HazardBase

class_name CraterGap

# ============================================================
# crater_gap.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 3: Hazards
# ============================================================
# Kill zone placed BELOW a crater gap in the terrain.
# When the rover falls through a gap it enters this Area2D.
# All kill logic is in HazardBase._on_body_entered().
#
# Placement:  center at gap midpoint X, 70 px below ground surface Y.
# ============================================================
