extends Area2D

func _on_Food_body_entered(body):
	if body.get_collision_layer() == 8:
		_respawn()

func _respawn():
	var x = rand_range(100, 800)
	var y = rand_range(100,600)
	position = Vector2(x, y)
