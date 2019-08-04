extends Area2D

var position_cache = []
func _physics_process(delta):
	var parent_pos = get_parent().position
	position_cache.push_back(parent_pos)
	if position_cache.size() >=10:
		global_position = position_cache[0]
		position_cache.remove(0)