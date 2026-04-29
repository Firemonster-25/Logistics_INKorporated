extends Area2D


@export var colour: String

func _on_body_entered(body):
	game_manager.current_colour = colour
	print(game_manager.current_colour)
