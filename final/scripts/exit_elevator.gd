extends Area2D

@export var overwrite: String

@onready var button_prompt = $ButtonPrompt



func _process(delta):
	if Input.is_action_just_pressed("interact") and button_prompt.visible:
		if overwrite:
			get_tree().change_scene_to_file(overwrite)
		else:
			get_tree().change_scene_to_file(GameManager.level_list[GameManager.next_level])



func _on_body_entered(body):
	button_prompt.visible = true

func _on_body_exited(body):
	button_prompt.visible = false
