extends Control

var selected = 0

var scenes = ["res://Main/Level.tscn", "res://Main/Creditos.tscn"]
onready var sel_list = [$"select_start", $"select_credits"]


func set_selected(val):
	for index in range(sel_list.size()):
		if val == index:
			sel_list[index].set_visible(true)
			selected = val
		else:
			sel_list[index].set_visible(false)

func _process(delta):
	
	if Input.is_action_just_pressed("ui_enter"):
		if(selected < scenes.size()):
			get_tree().change_scene(scenes[selected])
		
	if Input.is_action_pressed("ui_up"):
		if(selected > 0):
			set_selected(selected - 1)
	if Input.is_action_pressed("ui_down"):
		if(selected < sel_list.size() - 1):
			set_selected(selected+1)

func _ready():
	set_selected(0)
