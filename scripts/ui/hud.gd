extends CanvasLayer

# ============================================================
# hud.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 6: UI / Score / HUD
# ============================================================
# Responsibilities:
#   - Display live score (subscribes to ScoreManager.score_changed)
#   - Display checkpoint progress (cleared / total)
#   - Show optional one-line state message (STAGE COMPLETE etc.)
#
# NOT in scope: animations, transitions, game-over screens,
#   profile data, save display, fancy UI
# Wired from: test_lane.gd calls update_checkpoint() / show_state()
#             ScoreManager signal drives score label automatically
# ============================================================

@onready var _score_lbl : Label = $TopBar/ScoreLabel
@onready var _cp_lbl    : Label = $TopBar/CheckpointLabel
@onready var _state_lbl : Label = $StateLabel


func _ready() -> void:
	ScoreManager.score_changed.connect(_on_score_changed)
	_score_lbl.text = "SCORE: 0"
	_cp_lbl.text    = "CP: 0 / 3"
	_state_lbl.visible = false


# Called by ScoreManager signal whenever score changes.
func _on_score_changed(new_score: int) -> void:
	_score_lbl.text = "SCORE: %d" % new_score


# Called by test_lane.gd after each checkpoint is cleared.
func update_checkpoint(cleared: int, total: int) -> void:
	_cp_lbl.text = "CP: %d / %d" % [cleared, total]


# Called by test_lane.gd on stage complete (or any state message).
func show_state(text: String) -> void:
	_state_lbl.text    = text
	_state_lbl.visible = true
