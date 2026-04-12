extends Area2D


func _on_body_entered(body):
	get_tree().change_scene_to_packed(game_manager.next_level)
