extends KinematicBody2D

var direction = Vector2(0.3,1)
func _physics_process(delta):
	var collision = move_and_collide(direction.normalized()*100*delta)
	if collision != null:
		#var collisor_velocity = collision.collider_velocity.normalized()
		var collisor_normal = collision.normal
		var pivot_position = collision.collider.get_pivot_position()
		var colliding_position = collision.position
		var ricochet_direction = colliding_position - pivot_position
		ricochet_direction = ricochet_direction.normalized()
		direction = ricochet_direction
		#direction = collisor_normal + collisor_velocity