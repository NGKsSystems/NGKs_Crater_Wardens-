extends Node

# ObjectPoolManager — provides reusable pools for all spawned objects
# Usage: ObjectPoolManager.get_object("projectile_forward")
#        ObjectPoolManager.return_object("projectile_forward", node)

var _pools: Dictionary = {}
var _scenes: Dictionary = {}

func register_pool(key: String, scene: PackedScene, initial_size: int) -> void:
	_scenes[key] = scene
	_pools[key] = []
	for i in range(initial_size):
		var obj = scene.instance()
		obj.set_meta("pool_key", key)
		obj.hide()
		add_child(obj)
		_pools[key].append(obj)

func get_object(key: String) -> Node:
	if not _pools.has(key) or _pools[key].empty():
		if _scenes.has(key):
			var obj = _scenes[key].instance()
			obj.set_meta("pool_key", key)
			add_child(obj)
			return obj
		push_warning("ObjectPoolManager: no pool for key '%s'" % key)
		return null
	var obj = _pools[key].pop_back()
	obj.show()
	return obj

func return_object(key: String, obj: Node) -> void:
	obj.hide()
	if not _pools.has(key):
		_pools[key] = []
	_pools[key].append(obj)
