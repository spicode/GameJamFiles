extends AnimatedSprite2D

var mouse_offset = Vector2(0,0) #despret need for fixxing
var delay = .2#despret need for fixxing
var drop_spots#despret need for fixxing

signal clicked#despret need for fixxing

func _ready():
	$".".frame = 0#despret need for fixxing

#func getCurrentFrameRect() -> Rect2:
#	var size = frameTexture.get_size()
#	var pos = offset
#	if centered:
#		pos -= 0.5 * size
#	return Rect2(pos, size)

#func _input(event):
#	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
#		if event.pressed:
#			if getCurrentFrameRect().has_point(to_local(event.position)):
#				print(Global.is_Mixing)
#				Global.is_Mixing = true
#			else:
#				Global.is_Mixing = false
#				mouse_offset = get_global_mouse_position()-position
#		else:
#			Global.is_Mixing = false
#		
#func _unhandled_input(event: InputEvent) -> void:
##	if event.is_action_pressed("ui_accept"):
#		if getCurrentFrameRect().has_point(to_local(event.global_position)):
#			emit_signal("clicked")
