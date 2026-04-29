extends StaticBody2D

@export var connected_to: String

@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Sprite2D

func _ready():
	sprite_2d.texture = AtlasTexture.new()
	sprite_2d.texture.atlas = load("res://assets/test_puzzle_objects.png")
	sprite_2d.texture.region = Rect2(32, 32, 32, 64)
	sprite_2d.texture.filter_clip = true

func _process(delta):
	if game_manager.activated_buttons.has(connected_to):
		collision_shape_2d.disabled = true
		sprite_2d.texture.region = Rect2(64, 32, 32, 64)
	else:
		collision_shape_2d.disabled = false
		sprite_2d.texture.region = Rect2(32, 32, 32, 64)
