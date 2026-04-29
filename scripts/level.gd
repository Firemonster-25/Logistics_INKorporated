extends Node2D

@export var level_id: String
@export var default_respawn_point: Vector2
@export var next_level: String

func _ready():
	game_manager.respawn_point = default_respawn_point
	game_manager.next_level = next_level
	game_manager.level = get_node(get_path())
	game_manager.player = get_node("Player")
	game_manager.current_colour = "None"
