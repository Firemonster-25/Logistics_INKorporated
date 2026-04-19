extends Node2D

@export var level_id: int
@export var default_respawn_point: Vector2
@export var next_level: String

func _ready():
	game_manager.respawn_point = default_respawn_point
	game_manager.next_level = next_level
