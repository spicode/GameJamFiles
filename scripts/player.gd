extends CharacterBody2D

# Player properties
var speed = 200.0
var jump_force = -300.0  # Negative value for upward force
var gravity = 800.0
@onready var _animated_sprite = $AnimatedSprite2D
# State
var is_on_ground = false

func _ready():
	add_to_group("Player")
	
	
func _physics_process(delta):
	handle_input(delta)
	
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()
	if velocity.x < 0: 
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h =false
	if velocity.x == 0:
		_animated_sprite.play("idle")
		
		
func handle_input(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	velocity.x = input_vector.x * speed
	
	_animated_sprite.play("run")
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		_animated_sprite.play("jump")
		jump()

	
	
	
		
		

func jump():
	if is_on_floor():
		velocity.y = jump_force 
		
func _on_Foot_area_entered(area):
	is_on_ground = true

func _on_Foot_area_exited(area):
	is_on_ground = false
	_animated_sprite.play("jump")


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		get_tree().reload_current_scene()
