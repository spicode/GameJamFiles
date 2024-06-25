extends AnimatedSprite2D



func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed:
			var sprite_rect = Rect2(Vector2.ZERO, $".".sprite_frames.get_size())
			if sprite_rect.has_point(to_local(event.position)):
				print(Global.is_Mixing)
				Global.is_Mixing = true
		else:
			Global.is_Mixing = false
