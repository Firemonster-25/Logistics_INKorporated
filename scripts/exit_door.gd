extends Area2D

func _on_body_entered(body):
	load(game_manager.next_level)
	get_tree().change_scene_to_file(game_manager.next_level)
