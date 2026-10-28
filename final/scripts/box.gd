extends CharacterBody2D

@export var color: String

@onready var sprite_2d = $Sprite2D

const SPEED = 100.0

var push: int
var attached



func _ready():
	# Sets box to correct initial color visually
	if color == "Red":
		sprite_2d.texture.region = Rect2(32, 0, 32, 32)
	if color == "Green":
		sprite_2d.texture.region = Rect2(0, 32, 32, 32)
	if color == "Blue":
		sprite_2d.texture.region = Rect2(32, 32, 32, 32)

func _physics_process(delta):
	attach_to_player()
	
	apply_gravity(delta)
	
	handle_push()
	
	move_and_slide()



func apply_gravity(delta):
	# Handles gravity
	if not is_on_floor():
		# Extend height of jump if input is held and is attached to the player
		if Input.is_action_pressed("jump") and velocity.y <= 0 and attached == true:
			velocity += get_gravity() * delta * 0.45
		else:
			velocity += get_gravity() * delta


func handle_push():
	# Applies push
	velocity.x = push * SPEED

func _on_push_right_body_entered(body):
	push = 1

func _on_push_right_body_exited(body):
	push = 0

func _on_push_left_body_entered(body):
	push = -1

func _on_push_left_body_exited(body):
	push = 0


func _on_color_detector_area_entered(area):
	# Changes color if contact is made with a color pipe
	color = area.color
	if not area.color:
		sprite_2d.texture.region = Rect2(0, 0, 32, 32)
	if area.color == "Red":
		sprite_2d.texture.region = Rect2(32, 0, 32, 32)
	if area.color == "Green":
		sprite_2d.texture.region = Rect2(0, 32, 32, 32)
	if area.color == "Blue":
		sprite_2d.texture.region = Rect2(32, 32, 32, 32)


func attach_to_player():
	# Connects box to player if colors match
	if color:
		if GameManager.current_color == color and not attached:
			reparent(GameManager.player, true)
			attached = true
		elif not GameManager.current_color == color:
			reparent(GameManager.level, true)
			attached = false 
	elif attached:
		reparent(GameManager.level, true) 
		attached = false
