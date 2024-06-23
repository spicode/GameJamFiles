extends CharacterBody2D

# Player properties
var speed = 200.0
var jump_force = -150  # Negative value for upward force
var gravity = 800.0

# State
var is_on_ground = false

func _ready():
	pass

func _physics_process(delta):
	handle_input(delta)

	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()

func handle_input(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	velocity.x = input_vector.x * speed

	if is_on_floor() and Input.is_action_pressed("ui_up"):
		jump()

	# Debug prints
	print("Velocity:", velocity)
	print("Is on ground:", is_on_floor())

func jump():
	if is_on_floor():
		velocity.y = jump_force 

func _on_Foot_area_entered(area):
	is_on_ground = true

func _on_Foot_area_exited(area):
	is_on_ground = false



