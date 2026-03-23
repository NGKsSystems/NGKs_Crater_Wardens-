extends Area2D

# ============================================================
# projectile.gd — NGKs Crater Wardens V1 (Godot 4)
# Phase 2: Shooting Prototype
# ============================================================
# Responsibilities:
#   - Move at fixed velocity in assigned direction
#   - Self-remove after lifetime expires (pool-friendly)
#   - activate() called by rover_weapon.gd on pool retrieval
#
# NOT in scope: damage, hit effects, audio, enemy interaction
# NO per-frame allocations — no new Vector2 in _process
# Pool-compatible: hide/show via ObjectPoolManager
# ============================================================

var _velocity: Vector2 = Vector2.ZERO
var _lifetime: float   = 1.5
var _timer: float      = 0.0


# Called by rover_weapon.gd after get_object() from pool.
func activate(spawn_pos: Vector2, vel: Vector2, life: float) -> void:
	global_position = spawn_pos
	_velocity       = vel
	_lifetime       = life
	_timer          = 0.0
	show()


func _process(delta: float) -> void:
	if not visible:
		return
	position += _velocity * delta
	_timer   += delta
	if _timer >= _lifetime:
		_return_to_pool()


func _return_to_pool() -> void:
	var key: String = get_meta("pool_key", "")
	if key != "":
		ObjectPoolManager.return_object(key, self)
	else:
		queue_free()
