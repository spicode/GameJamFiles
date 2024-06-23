extends Sprite2D
var is_dragging = false #state management
var mouse_offset   #center mouse on click
var delay = 0.2

func _physics_process(delta):
	if is_dragging:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position",( get_global_mouse_position() - mouse_offset), delay * delta)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				print('clicked on sprite')
				is_dragging = true
				Global.is_dragging = true
				mouse_offset = get_global_mouse_position()-position
		else:
			is_dragging = false
			Global.is_dragging = false
