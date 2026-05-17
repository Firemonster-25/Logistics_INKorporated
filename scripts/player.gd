extends CharacterBody2D

@onready var coyote_timer = $CoyoteTimer
@onready var wall_cling_right = $WallClingRight
@onready var wall_cling_left = $WallClingLeft
@onready var camera_2d = $Camera2D
@onready var sprite_2d = $Sprite2D

const SPEED = 150.0
const AIR_CONTROL = 5
const JUMP_VELOCITY = -300.0
const FRICTION = 37.5
const AIR_RESISTANCE = 2.5

var direction = 0
var just_jumped = false
var coyote_time = false
var previous_colour: String
func _physics_process(delta):
	apply_gravity(delta)
	
	handle_jump()
	
	handle_movement()
	
	change_colour()
	
	move_and_slide()


func _on_hitbox_area_entered(area):
	position = game_manager.respawn_point

func _on_death_barrier_body_entered(body):
	position = game_manager.respawn_point

func apply_gravity(delta):
	if not is_on_floor():
		# Extend height of jump if input is held
		if Input.is_action_pressed("jump") and velocity.y <= 0:
			velocity += get_gravity() * delta * 0.75
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
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote_timer.time_left > 0):
		velocity.y = JUMP_VELOCITY
		just_jumped = true
		coyote_timer.stop()

func handle_movement():
	direction = Input.get_axis("move_left", "move_right")
	if direction:
			if is_on_floor():
				velocity.x = direction * SPEED 
			else:
				if (velocity.x < SPEED and direction > 0) or (velocity.x > -SPEED and direction < 0):
					velocity.x += direction * AIR_CONTROL
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, FRICTION)
	else:
		velocity.x = move_toward(velocity.x, 0, AIR_RESISTANCE)

func change_colour():
	if previous_colour != game_manager.current_colour:
		if not game_manager.current_colour:
			sprite_2d.texture.region = Rect2(0, 0, 32, 64)
		if game_manager.current_colour == "Red":
			sprite_2d.texture.region = Rect2(32, 0, 32, 64)
		if game_manager.current_colour == "Green":
			sprite_2d.texture.region = Rect2(64, 0, 32, 64)
		if game_manager.current_colour == "Blue":
			sprite_2d.texture.region = Rect2(96, 0, 32, 64)
	previous_colour = game_manager.current_colour
