extends Sprite2D

# Variables to control the arrow's movement
var arrow_speed: float = 200.0 # speed of the arrow movement
var direction: int = 1 # direction of the arrow movement (1 for right, -1 for left)

func _ready():
	# Place the arrow at the start position
	position = Vector2(0, position.y)

func _process(delta):
	# Move the arrow back and forth
	position.x += direction * arrow_speed * delta
	
	# Check if the arrow reaches the edges and reverse direction
	if position.x > get_viewport_rect().size.x - texture.get_size().x or position.x < 0:
		direction *= -1
	if Input.is_action_just_pressed("ui_accept"):
		down()
func down():

	position.y = position.y + 20
