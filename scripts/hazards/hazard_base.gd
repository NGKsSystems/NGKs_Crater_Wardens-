extends Area2D

class_name HazardBase

# ============================================================
# hazard_base.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 3: Hazards
# ============================================================
# Base class for all kill-zone hazards.
# All three hazard types (crater gap, mine, rock) extend this.
#
# Responsibilities:
#   - Detect when rover (CharacterBody2D) enters the Area2D
#   - Emit player_killed signal — test_lane.gd handles the reset
#
# NOT in scope: damage levels, score, effects, audio
# No per-frame allocations
# ============================================================

signal player_killed


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	# Only the rover (CharacterBody2D) triggers a kill.
	# StaticBody2D ground/platforms are ignored.
	if body is CharacterBody2D:
		player_killed.emit()
