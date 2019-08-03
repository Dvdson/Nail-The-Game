extends KinematicBody2D

signal dead

#properties
var vel_module = 300
var direction = Vector2(0.3,1)#ball direction

func _physics_process(delta):
	var collision = move_and_collide(direction.normalized()*vel_module*delta)
	if collision != null:
		var col_layer = collision.collider.get_collision_layer()
		match col_layer:
			2:#platform
				#redirecting ball
				var pivot_position = collision.collider.get_pivot_position()
				var colliding_position = collision.position
				var ricochet_direction = colliding_position - pivot_position
				ricochet_direction = ricochet_direction.normalized()
				direction = ricochet_direction
			4:#edge
				#death
				_death()
				pass
			16:#food
				_grow_snake()
				pass

func _death():
	emit_signal("dead")
	queue_free()

func _grow_snake():
	pass