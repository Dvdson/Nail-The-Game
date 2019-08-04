extends KinematicBody2D
enum {TYPE_NORMAL, TYPE_PHANTOM}
var type = TYPE_NORMAL setget set_type
var can_control = true
export var vel_module = 600


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
	var strength = 0
	var run = 1
	if can_control:
		if Input.is_action_pressed("button_left"):
			strength = Input.get_action_strength("button_left")
			velocity.y += -1.0
		if Input.is_action_pressed("button_right"):
			strength = Input.get_action_strength("button_right")
			velocity.y += 1.0
		if Input.is_action_pressed("square"):
			run = 3
		velocity *= vel_module * run * strength
		velocity = velocity.rotated(rotation)
		move_and_slide(velocity)

func get_pivot_position():
	return $"Position2D".get_global_position()