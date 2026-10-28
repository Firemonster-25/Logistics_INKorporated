extends Node

var highest_level_id: int



func _ready():
	# Loads highest level id from save file
	var save_file = FileAccess.open("user://save_file.save", FileAccess.READ)
	if save_file:
		highest_level_id = save_file.get_8()
		save_file.close()

func save(level_id):
	# Stores new highest level id to save file 
	if level_id > highest_level_id:
		highest_level_id = level_id
		var save_file = FileAccess.open("user://save_file.save", FileAccess.WRITE)
		save_file.store_8(highest_level_id)
		save_file.close()
