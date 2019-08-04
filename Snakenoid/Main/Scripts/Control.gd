extends Control

var selected = 0

var scenes = ["res://Main/Level.tscn", "res://Main/Creditos.tscn"]
onready var sel_list = [$"select_start", $"select_credits"]

const delay = 15
var delay_time_out = 0


func set_selected(val):
	for index in range(sel_list.size()):
		if val == index:
			sel_list[index].set_visible(true)
			selected = val
		else:
			sel_list[index].set_visible(false)

func _process(delta):
	
	if(delay_time_out > 0):
		delay_time_out-=1
	else:	
		if Input.is_action_just_pressed("ui_enter"):
			if(selected < scenes.size()):
				if(scenes[selected]):
					get_tree().change_scene(scenes[selected])
			
		if Input.is_action_pressed("button_left"):
			if(selected > 0):
				set_selected(selected - 1)
			delay_time_out = delay
		if Input.is_action_pressed("button_right"):
			if(selected < sel_list.size() - 1):
				set_selected(selected+1)
			delay_time_out = delay			

func _ready():
	set_selected(0)
