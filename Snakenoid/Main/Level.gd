extends Node2D
onready var packedPlatform = preload("res://Objects/Platform.tscn")

func spawn_phantom_platform(positionn):
	var phantom = packedPlatform.instance()
	phantom.set_type(1)
	phantom.position = positionn
	$PhantomPlatforms.add_child(phantom)