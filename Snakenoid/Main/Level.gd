extends Node2D
onready var packedPlatform = preload("res://Objects/Platform.tscn")
onready var packedBody = preload("res://SlitSnake/BodySlit.tscn")
onready var last_body = $Ball
onready var loose_screen = get_node("LooseScreen")
var size = 0
var game_end = false

func spawn_phantom_platform(transf):
	var phantom = packedPlatform.instance()
	phantom.set_type(1)
	phantom.transform = transf
	$PhantomPlatforms.add_child(phantom)

func _on_Food_food_collected():
	var new_body = packedBody.instance()
	last_body.call_deferred("add_child", new_body)
	last_body = new_body
	size += 1
	$PointCounter/points.text = str(size)
	pass

func _on_Ball_dead():
	game_end = true
	loose_screen.show_it()

func _process(delta):
	if game_end:
		if Input.is_action_just_pressed("ui_esc"):
			get_tree().change_scene("res://Main/Main menu.tscn")