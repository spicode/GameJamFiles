extends Area2D

var foods
var mouse_offset = Vector2(0,0) 
var respie_layers = ["flour"," Egg","water"]
var respie_sauce = ["oliveOil",]

# Called when the node enters the scene tree for the first time.
func _ready():
	foods = get_tree().get_nodes_in_group("foods")
	$SauceBowl.frame = 0
	$SauceBowl.visible = false
	$LayersBowl.frame = 0
func _process(delta):
	pass
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed:
			if get_viewport_rect().has_point(to_local(event.position)):
				print(Global.is_Mixing)
				Global.is_Mixing = true
			else:
				Global.is_Mixing = false
				mouse_offset = get_global_mouse_position()-position
		else:
			Global.is_Mixing = false
		


#func _on_body_entered(body):
#	print(body.name)
#	if body.is_in_group("foods"):
#		body.queue_free()
#		$SauceBowl.frame =+ 1
#		print(body.name)


func _on_area_entered(area):
	pass



func _on_area_2d_2_area_entered(area):
	print(area.name)
	var body = area.get_parent()
	if area.get_parent().is_in_group("foods"):
		body.queue_free()
		$SauceBowl.frame += 1
		print(body.name)


func _on_area_layer_area_entered(area):
	print(area.name)
	var body = area.get_parent()
	if area.get_parent().is_in_group("foods"):
		body.queue_free()
		$LayersBowl.frame += 1
		print(body.name)
