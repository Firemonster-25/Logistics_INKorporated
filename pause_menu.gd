extends CenterContainer


func _process(delta):
	if Input.is_action_just_pressed("pause") and get_tree().paused == true:
		hide()
		get_tree().paused = false
	elif Input.is_action_just_pressed("pause"):
		show()
		get_tree().paused = true
	
	if get_tree().paused == false:
		position.x = move_toward(position.x, game_manager.player.position.x - (size.x/2), 3)
		position.y = move_toward(position.y, game_manager.player.position.y - (size.y/2), 3)

func _on_continue_pressed():
	hide()
	get_tree().paused = false
	

func _on_restart_level_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()
