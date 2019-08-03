extends Control

func _process(delta):
	if(Input.is_action_just_pressed("ui_esc")):
		get_tree().change_scene("res://Main/Main menu.tscn")

func _ready():
	pass
