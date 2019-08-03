extends Area2D
signal food_collected

func _on_Food_body_entered(body):
	if body.get_collision_layer() == 72:
		emit_signal("food_collected")
		_respawn()

func _respawn():
	var x = rand_range(200, 800)
	var y = rand_range(200,450)
	position = Vector2(x, y)
