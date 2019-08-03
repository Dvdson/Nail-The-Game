extends RigidBody2D
var force_module = 500
var contact_pos = Vector2()

func _ready():
	apply_central_impulse(Vector2(0.3,1).normalized()*force_module)

func _physics_process(delta):
	if linear_velocity.length() >= 300:
		linear_velocity = linear_velocity.normalized()*300

func _integrate_forces(state):
	if(state.get_contact_count() >= 1):  #this check is needed or it will throw errors 
		contact_pos = state.get_contact_local_position(0)

func _on_head_body_entered(body):
	if body.is_in_group("Platform"):
		var pivot_position = body.get_pivot_position()
		var colliding_position = contact_pos
		var ricochet_direction = colliding_position - pivot_position
		print (linear_velocity.length())
		apply_central_impulse(ricochet_direction.normalized()*force_module)