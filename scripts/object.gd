extends Node2D

var draggble = false
var is_inside_dropble = false
var body_ref
var offset: Vector2
var initalPos: Vector2
# Called when the node enters the scene tree for the first time.

func _process(delta):
	if draggble:
		if Input.is_action_just_pressed("click"):
			initalPos= global_position
			offset = get_global_mouse_position()
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropble:
				tween.tween_property(self, "position", body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position",initalPos,0.2).set_ease(Tween.EASE_OUT)
		
		

func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggble = false
		scale = Vector2(1,1)
func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group('dropble'):
		is_inside_dropble = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body
func _on_area_2d_body_exited(body):
	pass # Replace with function body.
	if body.is_in_group('dropble'):
		is_inside_dropble = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
		draggble = true
		scale = Vector2(1.05, 1.05)
