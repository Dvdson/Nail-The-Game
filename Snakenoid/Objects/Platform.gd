extends KinematicBody2D
enum {TYPE_NORMAL, TYPE_PHANTOM}
var type = TYPE_NORMAL setget set_type

func set_type(new_type):
	type = new_type
	match type:
		TYPE_NORMAL:
			set_collision_layer_bit(1, true)
			set_collision_layer_bit(5, false)
		TYPE_PHANTOM:
			set_collision_layer_bit(1, false)
			set_collision_layer_bit(5, true)

export var vel_module = 900
func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("button_left"):
		velocity.y += -1.0
	if Input.is_action_pressed("button_right"):
		velocity.y += 1.0
	velocity *= vel_module
	velocity = velocity.rotated(rotation)
	move_and_collide(velocity*delta)

func get_pivot_position():
	return $"Position2D".get_global_position()