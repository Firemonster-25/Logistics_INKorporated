extends CharacterBody2D

@onready var coyote_timer = $CoyoteTimer
@onready var wall_cling_right = $WallClingRight
@onready var wall_cling_left = $WallClingLeft
@onready var body = $Body
@onready var head = $Body/Head
@onready var body_animation_player = $BodyAnimationPlayer
@onready var head_animation_player = $HeadAnimationPlayer

const SPEED = 150.0
const AIR_CONTROL = 9
const JUMP_VELOCITY = -300.0
const FRICTION = 37.5
const AIR_RESISTANCE = 2.5

var direction = 0
var just_jumped = false
var coyote_time = false
var previous_color: String
var queue_respawn = false
var respawn_delay = 2


func _physics_process(delta):
	respawn()
	
	apply_gravity(delta)
	
	handle_jump()
	
	handle_movement()
	
	change_colour()
	
	move_and_slide()



func apply_gravity(delta):
	# Handles gravity
	if not is_on_floor():
		# Extend height of jump if input is held
		if Input.is_action_pressed("jump") and velocity.y <= 0:
			velocity += get_gravity() * delta * 0.70
		elif ((wall_cling_right.is_colliding() and direction > 0) or (wall_cling_left.is_colliding() and direction < 0)) and velocity.y > 0:
			velocity += get_gravity() * delta * 0.2
		else:
			velocity += get_gravity() * delta
		# Start coyote time
		if not just_jumped and not coyote_time:
			coyote_timer.start()
			coyote_time = true
	else:
		just_jumped = false
		coyote_time = false

func handle_jump():
	# Add vertical velocity if is able to jump and does so
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote_timer.time_left > 0):
		body_animation_player.play("jump")
		velocity.y = JUMP_VELOCITY
		just_jumped = true
		coyote_timer.stop()
	

func handle_movement():
	# Adds/subtracts horizontal velocity based on player input 
	direction = Input.get_axis("move_left", "move_right")
	if direction:
			if direction < 0:
				body.flip_h = true
				head.flip_h = true
			else:
				body.flip_h = false
				head.flip_h = false
			if is_on_floor():
				if not just_jumped:
					body_animation_player.play("walk")
				velocity.x = direction * SPEED 
			else:
				if (velocity.x < SPEED and direction > 0) or (velocity.x > -SPEED and direction < 0):
					velocity.x += direction * AIR_CONTROL
	elif is_on_floor() and not just_jumped:
		body_animation_player.play("idle")
		velocity.x = move_toward(velocity.x, 0, FRICTION)
	else:
		velocity.x = move_toward(velocity.x, 0, AIR_RESISTANCE)


func _on_hitbox_area_entered(area):
	# Resets player to respawn point upon making contact with a hazard
	GameManager.current_color = ""
	queue_respawn = true

func respawn():
	if queue_respawn:
		respawn_delay -= 1
		if respawn_delay == 0:
			position = GameManager.respawn_point
			queue_respawn = false
			respawn_delay = 2


func change_colour():
	# Changes color if current color changed
	if previous_color != GameManager.current_color:
		if not GameManager.current_color:
			body.modulate = Color(1.0, 1.0, 1.0, 1.0)
		elif GameManager.current_color == "Red":
			body.modulate = Color(0.894, 0.231, 0.267, 1.0)
		elif GameManager.current_color == "Green":
			body.modulate = Color(0.388, 0.78, 0.302, 1.0)
		elif GameManager.current_color == "Blue":
			body.modulate = Color(0.0, 0.584, 0.914, 1.0)
	previous_color = GameManager.current_color
