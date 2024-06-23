extends RigidBody2D

# Enemy properties
var speed = 100.0
var patrol_distance = 200.0
var chase_distance = 300.0
var detection_radius = 150.0



# Enemy properties


# Nodes
@onready var sprite = $Sprite
@onready var ground_ray = $RayCast2D

# State
var direction: int = 1
var start_position: Vector2
var target_position: Vector2
var is_chasing: bool = false
var player: Node2D = null
var is_alive: bool = true

func _ready():
	start_position = global_position
	target_position = start_position + Vector2(patrol_distance, 0)
	
	ground_ray.enabled = true

func _physics_process(delta):
	if is_alive:
		if player and is_chasing:
			chase_player(delta)
		else:
			patrol(delta)
		check_ground()
		check_death()

func patrol(delta):
	var velocity = Vector2(speed * direction, linear_velocity.y)
	linear_velocity = velocity
	
	if abs(global_position.x - start_position.x) >= patrol_distance:
		direction *= -1

func chase_player(delta):
	var direction_to_player = (player.global_position - global_position).normalized()
	var velocity = direction_to_player * speed
	linear_velocity = Vector2(velocity.x, linear_velocity.y)

	if global_position.distance_to(player.global_position) > chase_distance:
		is_chasing = false

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

func _on_Player_detected(player_node):
	player = player_node
	is_chasing = true

func _on_Player_left():
	is_chasing = false

func _on_Player_body_entered(body):
	if body.name == "Player":
		emit_signal("Player_detected", body)
	elif body.name == "DeadlyObject":  # Assuming objects that can kill the enemy have this name
		die()

func _on_Player_body_exited(body):
	if body.name == "Player":
		emit_signal("Player_left")
