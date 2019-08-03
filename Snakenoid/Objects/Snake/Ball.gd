extends KinematicBody2D

signal dead
enum {TYPE_ASS, TYPE_BODY, TYPE_HEAD}
var type = TYPE_HEAD setget set_type#start as head

func set_type(new_type):
	type = new_type
	match type:
		#changing collisions
		TYPE_ASS:
			pass
		TYPE_BODY:
			pass
		TYPE_HEAD:
			pass

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
	#animation and feedback
	print("dead")

func _grow_snake():
	pass