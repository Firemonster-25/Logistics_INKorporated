extends Control

var first_level = preload("res://scenes/test_level_1.tscn")

func _on_start_pressed():
	get_tree().change_scene_to_packed(first_level)

func _on_quit_pressed():
	get_tree().quit()
