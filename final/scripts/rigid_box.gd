extends RigidBody2D



@onready var sprite_2d = $Sprite2D

var texture_positions = [0, 32]

func _ready():
	sprite_2d.texture.region = Rect2(texture_positions.pick_random(), texture_positions.pick_random(), 32, 32)
