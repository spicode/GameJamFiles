extends MarginContainer

# Define a custom signal
signal left_clicked


func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		emit_signal("left_clicked")
