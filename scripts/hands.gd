extends Node2D

var mouse_position = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	mouse_position = get_global_mouse_position()
	global_position = mouse_position
	if Global.is_dragging:
		$Sprite2D.texture = load("res://art/HANDS 1 HOLDING.png")
	elif Global.is_Mixing:
		$Sprite2D.texture = load("res://art/HANDS 3 STIRRING W SPOON.png")
	else:
		$Sprite2D.texture = load("res://art/HANDS 2 DEFAULT.png")
	
