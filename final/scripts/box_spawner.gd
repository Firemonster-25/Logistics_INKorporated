extends Node2D

var box = preload("res://final/scenes/prefabs/rigid_box.tscn")

@onready var timer = $Timer

var box_count = 0



func _on_timer_timeout():
	if box_count < 125:
		position = Vector2(randi_range(-100, 100), -225)
		var new_box = box.instantiate()
		add_child(new_box)
		new_box.reparent(get_parent())
		box_count += 1
	else:
		timer.stop()
