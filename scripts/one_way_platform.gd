extends StaticBody2D

@onready var collision_shape_2d = $PhasingCollider/CollisionShape2D

func _physics_process(delta):
	if Input.is_action_pressed("drop"):
		collision_shape_2d.disabled = true
	elif Input.is_action_just_released("drop"):
		collision_shape_2d.disabled = false
