extends Area2D

var activated = false



func _on_body_entered(body):
	if not activated:
		GameManager.respawn_point = position
		activated = true
