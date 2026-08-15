extends Label

@export_multiline() var english_text: String
@export_multiline() var german_text: String

func _ready():
	if game_manager.language == "English":
		text = english_text
	if game_manager.language == "German":
		text = german_text
