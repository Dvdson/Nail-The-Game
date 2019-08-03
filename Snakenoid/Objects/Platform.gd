extends KinematicBody2D

func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("button_left"):
		velocity.y += -1.0
	if Input.is_action_pressed("button_right"):
		velocity.y += 1.0
	velocity *= 200
	velocity = velocity.rotated(rotation)
	#print(rotation)
	move_and_collide(velocity*delta)

func get_pivot_position():
	return $"Position2D".get_global_position()