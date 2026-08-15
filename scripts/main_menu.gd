extends Control

@onready var level_selection = $HBoxContainer/VBoxContainer/HBoxContainer/LevelSelection

var first_level = "res://scenes/playtest_1/tutorial_basics.tscn"

func _on_start_pressed():
	get_tree().change_scene_to_file(first_level)

func _on_quit_pressed():
	get_tree().quit()

func _on_load_pressed():
	get_tree().change_scene_to_file("res://scenes/" + level_selection.text + ".tscn")
