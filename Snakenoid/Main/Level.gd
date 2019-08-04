extends Node2D
onready var packedBody = preload("res://SlitSnake/BodySlit.tscn")
onready var last_body = $Ball
onready var loose_screen = get_node("LooseScreen")
var size = 0
var game_end = false


func _on_Food_food_collected():
	var new_body = packedBody.instance()
	last_body.call_deferred("add_child", new_body)
	last_body = new_body
	size += 1
	$PointCounter/points.text = str(size)
	pass

func _on_Ball_dead():
	var score = File.new()
	if(!score.file_exists("res://Objects/score")):
		score.open("res://Objects/score", File.WRITE_READ)
		score.store_string(str(0))
		score.close()
		
	score.open("res://Objects/score", File.READ_WRITE)
	
	if size > int(score.get_as_text()):
		score.store_string(str(size))
		pass
		
	game_end = true
	loose_screen.show_it()
	score.close()

func _process(delta):
	if game_end:
		if Input.is_action_just_pressed("ui_esc"):
			get_tree().change_scene("res://Main/Main menu.tscn")