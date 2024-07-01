extends AnimatedSprite2D

var mouse_offset = Vector2(0,0) 
var delay = .2
var drop_spots

signal clicked

func _ready():
	$".".frame = 0

func _on_area_layer_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed:
				print(Global.is_Mixing)
				Global.is_Mixing = true	
		else:
			Global.is_Mixing = false
		
