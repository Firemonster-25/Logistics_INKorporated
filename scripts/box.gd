extends CharacterBody2D

@export var colour: String

@onready var sprite_2d = $Sprite2D

const SPEED = 100.0

var push: int
var previous_colour

func _ready():
	sprite_2d.texture = AtlasTexture.new()
	sprite_2d.texture.atlas = load("res://assets/test_boxes.png")
	sprite_2d.texture.filter_clip = true
	if not colour:
		sprite_2d.texture.region = Rect2(0, 0, 32, 32)
	if colour == "Red":
		sprite_2d.texture.region = Rect2(32, 0, 32, 32)
	if colour == "Green":
		sprite_2d.texture.region = Rect2(64, 0, 32, 32)
	if colour == "Blue":
		sprite_2d.texture.region = Rect2(96, 0, 32, 32)

func _physics_process(delta):
	attach_to_player()
	
	apply_gravity(delta)
	
	handle_push()
	
	move_and_slide()

func apply_gravity(delta):
	if not is_on_floor():
		# Extend height of jump if input is held
		if Input.is_action_pressed("jump") and velocity.y <= 0:
			velocity += get_gravity() * delta * 0.50
		else:
			velocity += get_gravity() * delta

func handle_push():
	velocity.x = push * SPEED

func attach_to_player():
	if colour:
		if previous_colour != colour and game_manager.current_colour == colour:
			reparent(game_manager.player, true)
		elif not game_manager.current_colour == colour:
			reparent(game_manager.level, true) 
	elif previous_colour != colour:
		reparent(game_manager.level, true) 
	previous_colour = game_manager.current_colour

func _on_push_right_body_entered(body):
	push = 1

func _on_push_left_body_entered(body):
	push = -1

func _on_push_right_body_exited(body):
	push = 0

func _on_push_left_body_exited(body):
	push = 0

func _on_color_detector_area_entered(area):
	colour = area.colour
	if not area.colour:
		sprite_2d.texture.region = Rect2(0, 0, 32, 32)
	if area.colour == "Red":
		sprite_2d.texture.region = Rect2(32, 0, 32, 32)
	if area.colour == "Green":
		sprite_2d.texture.region = Rect2(64, 0, 32, 32)
	if area.colour == "Blue":
		sprite_2d.texture.region = Rect2(96, 0, 32, 32)
