extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property($Label,"position",Vector2($Label.position.x,$Label.position.y -2355,),20)
	if $Label.position.y <= -1320:
		get_tree().change_scene_to_file("res://places/level 1.tscn")
		print("credits done")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
