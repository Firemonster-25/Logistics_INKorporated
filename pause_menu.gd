extends CenterContainer

func _process(delta):
	if Input.is_action_just_pressed("pause") and get_tree().paused == true:
		hide()
		get_tree().paused = false
	elif Input.is_action_just_pressed("pause"):
		show()
		get_tree().paused = true

func _on_continue_pressed():
	hide()
	get_tree().paused = false

func _on_restart_level_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
