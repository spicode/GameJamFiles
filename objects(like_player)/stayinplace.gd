extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("screen") # Replace with function body.
	$AnimatedSprite.frame = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_2d_body_exited(body):
	if is_in_group("foods"):
		Global.is_out_of_bounds = true
		print("out of bounds")
