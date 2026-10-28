extends StaticBody2D

@export var connected_to: String

@onready var collision_shape_2d = $CollisionShape2D
@onready var animation_player = $AnimationPlayer

var open = false



func _process(delta):
	# Opens/Closes door upon a pressure plate being pressed/released
	if GameManager.activated_objects.has(connected_to) and not open:
		animation_player.play("open")
		collision_shape_2d.disabled = true
		open = true
	elif open and not GameManager.activated_objects.has(connected_to):
		animation_player.play_backwards("open")
		collision_shape_2d.disabled = false
		open = false
