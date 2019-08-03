extends Node2D
onready var packedPlatform = preload("res://Objects/Platform.tscn")
onready var packedBall = preload("res://Objects/Snake/Ball.tscn")

func spawn_phantom_platform(transf):
	var phantom = packedPlatform.instance()
	phantom.set_type(1)
	phantom.transform = transf
	$PhantomPlatforms.add_child(phantom)

func _on_Food_food_collected():
	pass
