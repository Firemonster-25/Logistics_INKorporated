extends StaticBody2D

@export var connected_to: String

@onready var sprite_2d = $Sprite2D

func _ready():
	sprite_2d.texture = AtlasTexture.new()
	sprite_2d.texture.atlas = load("res://assets/test_puzzle_objects.png")
	sprite_2d.texture.region = Rect2(32, 0, 32, 32)
	sprite_2d.texture.filter_clip = true

func _on_area_2d_body_entered(body):
	game_manager.activated_buttons.append(connected_to) 
	sprite_2d.texture.region = Rect2(64, 0, 32, 32)

func _on_area_2d_body_exited(body):
	game_manager.activated_buttons.erase(connected_to) 
	sprite_2d.texture.region = Rect2(32, 0, 32, 32)
