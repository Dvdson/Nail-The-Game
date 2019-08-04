extends Control

onready var bgs = [$"bg1", $"bg2"]
onready var bottom = OS.window_position.y + OS.window_size.y
var vel = 1

func bg_invert():
	bgs[0].rect_position.y = bgs[1].rect_position.y - bgs[0].rect_size.y
	
	var aux = bgs[0]
	bgs[0] = bgs[1]
	bgs[1] = aux
	

func bg_move():
	
	bgs[0].rect_position.y+=vel
	bgs[1].rect_position.y+=vel
	
	if(bgs[0].rect_position.y > bottom):
		bg_invert()	

func _process(delta):
	bg_move()
	
	pass
	
func _ready():
	pass