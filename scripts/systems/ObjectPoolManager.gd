extends Node

# ObjectPoolManager — provides reusable pools for all spawned objects
# Usage: ObjectPoolManager.get_object("projectile_forward")
#        ObjectPoolManager.return_object("projectile_forward", node)

var _pools: Dictionary = {}
var _scenes: Dictionary = {}

func register_pool(key: String, scene: PackedScene, initial_size: int) -> void:
	# If already registered, free orphaned pool nodes to prevent accumulation on scene reload
	if _pools.has(key):
		for obj in _pools[key]:
			obj.queue_free()
	_scenes[key] = scene
	_pools[key] = []
	for i in range(initial_size):
		var obj = scene.instantiate()
		obj.set_meta("pool_key", key)
		obj.hide()
		add_child(obj)
		_pools[key].append(obj)

func get_object(key: String) -> Node:
	# Fast path — pool has idle objects
	if _pools.has(key) and not _pools[key].is_empty():
		var obj: Node = _pools[key].pop_back()
		obj.show()
		return obj
	# Slow path — pool empty but scene registered; expand pool dynamically
	if _scenes.has(key):
		push_warning("[Pool] '%s' empty — dynamic expand" % key)
		var obj: Node = _scenes[key].instantiate()
		obj.set_meta("pool_key", key)
		add_child(obj)
		obj.show()
		return obj
	# Error — key never registered
	push_error("[Pool] no registration for key '%s' — cannot spawn" % key)
	return null

func return_object(key: String, obj: Node) -> void:
	obj.hide()
	if not _pools.has(key):
		_pools[key] = []
	_pools[key].append(obj)
