extends KinematicBody2D

signal dead
enum {TYPE_ASS, TYPE_BODY, TYPE_HEAD}
var type = TYPE_HEAD setget set_type#start as head

func set_type(new_type):
	type = new_type
	set_collision_layer_bit(6, false)
	set_collision_layer_bit(7, false)
	set_collision_layer_bit(8,false)
	match type:
		#changing collisions
		TYPE_ASS:
			set_collision_layer_bit(8, true)#set layer ass
			set_collision_mask_bit(8, false)
		TYPE_BODY:
			set_collision_layer_bit(7, true)#set layer body
			set_collision_mask_bit(8, false)#dont collides with ass
		TYPE_HEAD:
			set_collision_layer_bit(6, true)#set layer head
			set_collision_mask_bit(8, true)#collides with ass

#properties
var vel_module = 300
var direction = Vector2(0.3,1)#ball direction

func _physics_process(delta):
	var collision = move_and_collide(direction.normalized()*vel_module*delta)
	if collision != null:
		var col_layer = collision.collider.get_collision_layer()
		print(col_layer)
		match col_layer:
			2:#platform
				#redirecting ball
				var pivot_position = collision.collider.get_pivot_position()
				var colliding_position = collision.position
				var ricochet_direction = colliding_position - pivot_position
				ricochet_direction = ricochet_direction.normalized()
				direction = ricochet_direction
				#spawn phantom
				_spawn_phantom(collision.collider.get_transform())
			32:#phantom
				if type == TYPE_ASS:
					#destroy phantom
					collision.collider.queue_free()
			4:#edge
				#death
				_death()
				pass

func _spawn_phantom(transf):
	$"../".spawn_phantom_platform(transf)
	pass

func _death():
	emit_signal("dead")
	queue_free()
	#animation and feedback
	print("dead")