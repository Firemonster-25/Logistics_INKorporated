extends Node

var language: String
var player: CharacterBody2D
var level: Node2D
var next_level: int
var respawn_point = Vector2(0, 0)
var previous_respawn_point
var activated_objects: Array[String]
var current_color: String
var level_list = ["res://final/scenes/levels/tutorial.tscn", "res://final/scenes/levels/level_1.tscn", "res://final/scenes/levels/level_2.tscn", "res://final/scenes/levels/level_3.tscn", "res://final/scenes/levels/tutorial_objects.tscn", "res://final/scenes/levels/level_objects_1.tscn", "res://final/scenes/levels/level_objects_2.tscn", "res://final/scenes/levels/level_objects_3.tscn", "res://final/scenes/levels/level_objects_4.tscn", "res://final/scenes/levels/level_objects_5.tscn", "res://final/scenes/levels/tutorial_paint.tscn", "res://final/scenes/levels/level_paint_1.tscn", "res://final/scenes/levels/level_paint_2.tscn", "res://final/scenes/levels/level_paint_3.tscn", "res://final/scenes/levels/level_paint_4.tscn", "res://final/scenes/levels/level_paint_5.tscn", "res://final/scenes/levels/level_paint_6.tscn", "res://final/scenes/levels/level_paint_7.tscn"]
