extends Node

# ============================================================
# level_flow_manager.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 10: Level Progression Flow
# ============================================================
# Responsibilities:
#   - Maintain ordered list of level scene paths
#   - Track which level is currently active (current_index)
#   - Advance to next level or return to main menu after final level
#
# Exposed API (called from test_lane.gd _on_stage_complete):
#   start_game()          — load level 1 from any context
#   load_next_level()     — advance current_index, change scene
#   reset_to_first_level()— reset index to 0, load level 1
#
# NOT in scope: save/load, level select, world map, transitions,
#   story screens, score persistence across levels
# ============================================================

const LEVELS: Array[String] = [
	"res://scenes/level/test_lane.tscn",
	"res://scenes/level/test_lane_2.tscn",
	"res://scenes/level/test_lane_3.tscn",
]

const MAIN_MENU: String = "res://scenes/ui/main_menu.tscn"

var current_index: int = 0


# Load level 1 and reset progression. Called from main menu or any cold start.
func start_game() -> void:
	current_index = 0
	print("[LevelFlow] start_game() — loading %s" % LEVELS[current_index])
	get_tree().change_scene_to_file(LEVELS[current_index])


# Advance to the next level. If past the last level, return to main menu.
# Called by test_lane.gd after the 1-second STAGE COMPLETE delay.
func load_next_level() -> void:
	current_index += 1
	if current_index < LEVELS.size():
		print("[LevelFlow] load_next_level() — loading level %d: %s" % [current_index + 1, LEVELS[current_index]])
		get_tree().change_scene_to_file(LEVELS[current_index])
	else:
		print("[LevelFlow] All levels complete — returning to main menu")
		current_index = 0
		get_tree().change_scene_to_file(MAIN_MENU)


# Reset state and reload level 1. Use for full restart from menu.
func reset_to_first_level() -> void:
	current_index = 0
	print("[LevelFlow] reset_to_first_level() — loading %s" % LEVELS[current_index])
	get_tree().change_scene_to_file(LEVELS[current_index])
