extends RigidBody2D

# Enemy propertiesvar speed = 100.0
@export var patrol_distance = 1
@export var chase_distance = 300.0
@export var detection_radius = 150.0
@export var speed = 133.0

# Nodes
@onready var sprite = $Sprite
@onready var ground_ray = $RayCast2D

# State
var direction: int = 1
var start_position: Vector2
var target_position: Vector2
var is_chasing: bool = false
var is_alive: bool = true

func _ready():
	start_position = global_position
	target_position = start_position + Vector2(patrol_distance, 0)
	ground_ray.enabled = true
	ground_ray.cast_to = Vector2(0, 20)
func patrol(delta):
	var velocity = Vector2(speed * direction, linear_velocity.y)
	linear_velocity = velocity



func _physics_process(delta):
	if is_alive:
		if is_chasing:
			chase_player(delta)
		else:
			patrol(delta)
		check_ground()
		check_death()


	var velocity = Vector2(speed * direction, linear_velocity.y)
	linear_velocity = velocity
	
	if abs(global_position.x - start_position.x) >= patrol_distance:
		direction *= -1

func chase_player(delta):
	# Here you can add logic to chase the player if needed
	# For now, we'll keep it simple
	patrol(delta)

func check_ground():
	if not ground_ray.is_colliding():
		direction *= -1

func check_death():
	# Example condition for death: falling below a certain Y-coordinate
	if global_position.y > 1000:  # Adjust this value based on your game
		die()

func die():
	is_alive = false
	queue_free()  # Remove the enemy from the scene

# Optional: Add detection logic for player or other entities
# For example, you can emit a signal when the player enters the detection radius

func _on_Player_detected(player_node): is_chasing = true

func _on_Player_left():is_chasing = false

func _on_Player_body_entered(body):
	if body.name == "Player":
		emit_signal("Player_detected", body)
func _on_Player_body_exited(body):
	if body.name == "Player": emit_signal("Player_left")
	



