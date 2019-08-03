extends RigidBody2D

func _physics_process(delta):
	for bodie in get_colliding_bodies():
		print(bodie)
