extends TextureButton

@onready var label = $Label



func _ready():
	label.text = name
	if (int(name) - 1) <= SaveSystem.highest_level_id:
		visible = true



func _on_pressed():
	get_tree().change_scene_to_file(GameManager.level_list[int(name) - 1])
