extends KinematicBody2D
enum {TYPE_NORMAL, TYPE_PHANTOM}
var type = TYPE_NORMAL setget set_type
var can_control = true
export var vel_module = 900


func get_transform():
	return transform

func set_type(new_type):
	type = new_type
	match type:
		TYPE_NORMAL:
			set_collision_layer_bit(1, true)#platform true
			set_collision_layer_bit(5, false)#phantom false
			set_collision_mask_bit(6, true) #collides with head
			set_collision_mask_bit(7, false) #dont collides with body
			set_collision_mask_bit(8, false) #dont collides with ass
			$icon.modulate = Color("#ffffff")
			can_control = true
		TYPE_PHANTOM:
			set_collision_layer_bit(1, false)
			set_collision_layer_bit(5, true)
			set_collision_mask_bit(6, false) #dont collides with head
			set_collision_mask_bit(7, true) #collides with body
			set_collision_mask_bit(8,true) #collides with ass
			$icon.modulate = Color("#6f3c3636")
			can_control = false

func _physics_process(delta):
	var velocity = Vector2()
	if can_control:
		if Input.is_action_pressed("button_left"):
			velocity.y += -1.0
		if Input.is_action_pressed("button_right"):
			velocity.y += 1.0
		velocity *= vel_module
		velocity = velocity.rotated(rotation)
		move_and_slide_with_snap(velocity, Vector2(0,1))

func get_pivot_position():
	return $"Position2D".get_global_position()