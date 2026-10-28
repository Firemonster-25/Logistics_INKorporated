extends Area2D

@export var connected_to: String

@onready var button_prompt = $ButtonPrompt
@onready var sprite_2d = $Sprite2D

var on = false



func _process(delta):
	if Input.is_action_just_pressed("interact") and button_prompt.visible:
		if not on:
			sprite_2d.texture.region = Rect2(16, 0, 16, 32)
			on = true
			GameManager.activated_objects.append(connected_to)
		elif on:
			sprite_2d.texture.region = Rect2(0, 0, 16, 32)
			on = false
			GameManager.activated_objects.erase(connected_to)



func _on_body_entered(body):
	button_prompt.visible = true

func _on_body_exited(body):
	button_prompt.visible = false
