extends AnimatedSprite2D

var mouse_offset #center mouse on click
var delay = .2
var drop_spots

func _ready():
	drop_spots = get_tree().get_nodes_in_group("drop_spot_group")
	print(drop_spots)
func _physics_process(delta):
	if Global.is_dragging == true:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position()-mouse_offset, delay * delta)
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				print(Global.is_Mixing)
				Global.is_Mixing = true
			else:
				Global.is_Mixing = false
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				print('clicked on sprite')
				Global.is_dragging = true
				mouse_offset = get_global_mouse_position()-global_position
		else:
			Global.is_dragging = false
			for drop_spot in drop_spots:
				if drop_spot.has_overlapping_areas() and drop_spot.get_overlapping_areas().has(self.get_node("Area2D")):
					var snap_position = drop_spot.position
					var tween = get_tree().create_tween()
					tween.tween_property(self, "position", snap_position, delay)

