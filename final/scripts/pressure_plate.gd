extends StaticBody2D

@export var connected_to: String
@export var color: String

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D

var box_count = 0



func _ready():
	if color:
		if color == "Red":
			sprite_2d.texture.region = Rect2(32, 0, 32, 16)
		if color == "Green":
			sprite_2d.texture.region = Rect2(0, 32, 32, 16)
		if color == "Blue":
			sprite_2d.texture.region = Rect2(32, 32, 32, 16)



func _on_area_2d_body_entered(body):
	if body.color == color or not color:
		box_count += 1
		# Sets Button to activated state
		GameManager.activated_objects.append(connected_to)
		collision_shape_2d.shape.size = Vector2(32, 14)
		if not color:
			sprite_2d.texture.region = Rect2(0, 16, 32, 16)
		elif color == "Red":
			sprite_2d.texture.region = Rect2(32, 16, 32, 16)
		elif color == "Green":
			sprite_2d.texture.region = Rect2(0, 48, 32, 16)
		elif color == "Blue":
			sprite_2d.texture.region = Rect2(32, 48, 32, 16)

func _on_area_2d_body_exited(body):
	# Sets button to deactivated state if no box remains on the pressure plate
	box_count -= 1
	if box_count <= 0:
		box_count = 0
		GameManager.activated_objects.erase(connected_to) 
		collision_shape_2d.shape.size = Vector2(32, 16)
		if not color:
			sprite_2d.texture.region = Rect2(0, 0, 32, 16)
		elif color == "Red":
			sprite_2d.texture.region = Rect2(32, 0, 32, 16)
		elif color == "Green":
			sprite_2d.texture.region = Rect2(0, 32, 32, 16)
		elif color == "Blue":
			sprite_2d.texture.region = Rect2(32, 32, 32, 16)
