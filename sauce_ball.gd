extends AnimatedSprite2D

var mouse_offset #center mouse on click
var delay = .2
var drop_spots

func get_bounding_rect() -> Rect2:
	var current_frame: int = get_frame()
	var current_animation: String = animation
	var sprite_frames: SpriteFrames

	if sprite_frames and sprite_frames.has_animation(current_animation):
		var texture: Texture2D = sprite_frames.get_frame(current_animation, current_frame)

		if texture:
			var size: Vector2 = texture.get_size()
			var offset: Vector2 = Vector2.ZERO

			if flip_h:
				offset.x = -size.x
			if flip_v:
				offset.y = -size.y
				return Rect2(offset * scale, size * scale)
	return Rect2()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed:
			if Rect2().has_point(to_local(event.position)):
				print(Global.is_Mixing)
				Global.is_Mixing = true
			else:
				Global.is_Mixing = false
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if Rect2().has_point(to_local(event.position)):
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


