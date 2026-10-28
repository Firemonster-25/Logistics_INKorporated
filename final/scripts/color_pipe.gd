extends Area2D

@export var color: String
@export var deactivated: bool
@export var connected_to: String

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D

var toggleable = false

func _ready():
	# Sets pipe to correct color/deactivated state
	if deactivated:
		toggleable = true
		sprite_2d.texture.region = Rect2(0, 0, 32, 96)
		collision_shape_2d.disabled = true
	elif not color:
		sprite_2d.texture.region = Rect2(32, 0, 32, 96)
	elif color == "Red":
		sprite_2d.texture.region = Rect2(64, 0, 32, 96)
	elif color == "Green":
		sprite_2d.texture.region = Rect2(96, 0, 32, 96)
	elif color == "Blue":
		sprite_2d.texture.region = Rect2(128, 0, 32, 96)

func _process(delta):
	# Turns color pipe on/off upon a pressure plate being pressed/released if the pipe is toggleable
	if GameManager.activated_objects.has(connected_to) and deactivated:
		deactivated = false
		collision_shape_2d.disabled = false
		if not color:
			sprite_2d.texture.region = Rect2(32, 0, 32, 96)
		elif color == "Red":
			sprite_2d.texture.region = Rect2(64, 0, 32, 96)
		elif color == "Green":
			sprite_2d.texture.region = Rect2(96, 0, 32, 96)
		elif color == "Blue":
			sprite_2d.texture.region = Rect2(128, 0, 32, 96)
	elif toggleable and not GameManager.activated_objects.has(connected_to):
		sprite_2d.texture.region = Rect2(0, 0, 32, 96)
		deactivated = true
		collision_shape_2d.disabled = true



func _on_body_entered(body):
	GameManager.current_color = color
