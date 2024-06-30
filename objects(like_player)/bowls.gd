extends Area2D

var foods
var making_layer = true
var Respie_making = 1
var Respie_lvl = 0
var making_sauce = false
var mouse_offset = Vector2(0,0) 
var respie_layers = ["flour","egg","water",""]
var respie_sauce = ["condecsedTomato","oliveOil","parlsy","garlic","onion","tomato","salt",""]
@onready var layers_bowl = $LayersBowl
@onready var sauce_bowl = $SauceBowl


# Called when the node enters the scene tree for the first time.
func _ready():
	foods = get_tree().get_nodes_in_group("foods")
	$SauceBowl.frame = 0
	$SauceBowl.visible = false
	$LayersBowl.frame = 0
	$"../ingredints/lasagna layers".visible = false
	$"../ingredints/SauceBowlI".visible = false
	Respie_making = 1
	if is_instance_valid(layers_bowl):
		print("LayersBowl node found!")
	else:
		print("LayersBowl node not found!")
	await $LayersBowl.animation_finished
func _process(delta):
	
	if Respie_making == 2:
		$SauceBowl.visible = true
	if is_instance_valid(layers_bowl) and layers_bowl.frame == 3:
		if Global.is_Mixing:
			layers_bowl.frame = 4
			
			get_tree().create_timer(5.0).timeout
			Respie_making += 1
			Respie_lvl = 0
			layers_bowl.queue_free()
			$"../ingredints/lasagna layers".visible = true
			
	if is_instance_valid(sauce_bowl)and sauce_bowl.frame == 7:
		if Global.is_Mixing:
			sauce_bowl.frame = 8
			get_tree().create_timer(4).timeout
			Respie_making += 1
			$SauceBowl.queue_free()
			$"../ingredints/SauceBowlI".visible = true
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed:
			if get_viewport_rect().has_point(to_local(event.position)):
				
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






func _on_area_layer_area_entered(area):
	var body = area.get_parent()
	
	
	if Respie_making == 1:
		if area.get_parent().is_in_group("foods") and body.name == respie_layers[Respie_lvl]:
			body.queue_free()
			layers_bowl.frame += 1
			Respie_lvl += 1
			


func _on_area_sause_area_entered(area):
	var body = area.get_parent()
	if Respie_making == 2:
		$SauceBowl.visible = true
		if area.get_parent().is_in_group("foods") and body.name == respie_sauce[Respie_lvl]:
			if area.get_parent().is_in_group("foods"):
				body.queue_free()
				$SauceBowl.frame += 1
				Respie_lvl += 1
			



#func _on_layers_bowl_animation_finished():
#	Respie_making+=1
#	print("done")
