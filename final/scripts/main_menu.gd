extends Camera2D

@onready var box_container = $BoxContainer
@onready var option_menu = $OptionMenu
@onready var level_select = $LevelSelect
@onready var continue_button = $English/Continue



func _ready():
	if SaveSystem.highest_level_id:
		continue_button.visible = true

func _on_continue_pressed():
	get_tree().change_scene_to_file(GameManager.level_list[SaveSystem.highest_level_id])

func _on_start_pressed():
	get_tree().change_scene_to_file("res://final/scenes/levels/intro.tscn")

func _on_select_level_pressed():
	if level_select.visible:
		level_select.visible = false
	else:
		level_select.visible = true

func _on_options_pressed():
	if option_menu.visible:
		option_menu.visible = false
	else:
		option_menu.visible = true

func _on_quit_pressed():
	get_tree().quit()


func _on_close_pressed():
	if option_menu.visible:
		option_menu.visible = false
	else:
		level_select.visible = false
