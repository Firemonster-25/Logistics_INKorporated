extends Camera2D

@export var next_level: String

@onready var timer = $Timer



func _process(delta):
	if Input.is_anything_pressed() and timer.time_left == 0:
		get_tree().change_scene_to_file(next_level)
