extends Area2D



func _ready():
	if not GameManager.previous_respawn_point:
		GameManager.respawn_point = position
