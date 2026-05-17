extends Area2D

@export var colour: String

@onready var sprite_2d = $Sprite2D

func _ready():
	sprite_2d.texture = AtlasTexture.new()
	sprite_2d.texture.atlas = load("res://assets/test_colour_pipes.png")
	sprite_2d.texture.filter_clip = true
	if not colour:
		sprite_2d.texture.region = Rect2(0, 0, 32, 96)
	if colour == "Red":
		sprite_2d.texture.region = Rect2(32, 0, 32, 96)
	if colour == "Green":
		sprite_2d.texture.region = Rect2(64, 0, 32, 96)
	if colour == "Blue":
		sprite_2d.texture.region = Rect2(96, 0, 32, 96)

func _on_body_entered(body):
	game_manager.current_colour = colour
	print(game_manager.current_colour)
