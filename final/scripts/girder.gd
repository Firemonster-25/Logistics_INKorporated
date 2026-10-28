extends StaticBody2D

@export var length = 1

@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Sprite2D
@onready var box_collision_shape_2d = $BoxCollider/BoxCollisionShape2D



func _ready():
	sprite_2d.region_rect = Rect2(0, 0, 16 * length, 16)
	collision_shape_2d.shape.size = Vector2(16 * length, 16)
	box_collision_shape_2d.shape.size = Vector2(16 * length, 16)

func _physics_process(delta):
	if Input.is_action_pressed("drop"):
		collision_shape_2d.disabled = true
	elif Input.is_action_just_released("drop"):
		collision_shape_2d.disabled = false
