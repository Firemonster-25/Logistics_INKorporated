extends Control


func _on_english_pressed():
	game_manager.language = "English"
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_german_pressed():
	game_manager.language = "German"
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
