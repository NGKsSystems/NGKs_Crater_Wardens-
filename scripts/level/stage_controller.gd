extends Node

# ============================================================
# stage_controller.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 5: Stage Structure
# ============================================================
# Responsibilities:
#   - Track ordered checkpoint progression (_expected starts at 1)
#   - Enforce strict ordering: CP N only accepted when _expected == N
#   - Detect stage completion when all checkpoints passed + finish hit
#
# NOT in scope: score, respawn, save/load, UI, menus, audio
# Called from: test_lane.gd (_on_checkpoint_reached, _on_finish_entered)
# Reset: scene reload destroys this node — all state resets automatically
# ============================================================

@export var total_checkpoints: int = 3

var _expected: int      = 1
var stage_complete: bool = false


# Called by test_lane.gd when a checkpoint_marker emits checkpoint_reached(index).
func on_checkpoint(index: int) -> void:
	if stage_complete:
		return
	if index == _expected:
		_expected += 1
		print("[Stage] CP%d PASS — %d/%d checkpoints cleared" % [index, _expected - 1, total_checkpoints])
	else:
		print("[Stage] CP%d ignored — expected CP%d" % [index, _expected])


# Called by test_lane.gd when the rover body_entered the FinishTrigger Area2D.
func on_finish() -> void:
	if stage_complete:
		return
	if _expected > total_checkpoints:
		stage_complete = true
		print("[Stage] *** STAGE COMPLETE — all %d checkpoints cleared! ***" % total_checkpoints)
	else:
		print("[Stage] Finish reached early — %d/%d checkpoints — ignored" % [_expected - 1, total_checkpoints])
