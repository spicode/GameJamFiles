extends Sprite2D
var is_dragging = false #state management
var mouse_offset   #center mouse on click
var delay = 10
var drop_spots

func _ready():
	add_to_group("foods")
func _physics_process(delta):
	if Global.is_out_of_bounds:
		position = Vector2(0,0)
		Global.is_out_of_bounds = false
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
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				print('clicked on sprite')
				Global.is_Mixing = true
				mouse_offset = get_global_mouse_position()-position
		else:
			
			for drop_spot in drop_spots:
				if drop_spot.has_overlapping_areas() and drop_spot.get_overlapping_areas().has(self.get_node("Area2D")):
					var snap_position = drop_spot.position
					var tween = get_tree().create_tween()
					tween.tween_property(self, "position", snap_position, delay)



func _on_area_2d_enterd(area):
	if area.is_in_group("screen"):
		queue_free()
