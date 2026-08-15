extends Node

var language: String
var player: CharacterBody2D
var level: Node2D
var next_level: String
var respawn_point = Vector2(0, 0)
var activated_buttons: Array[String]
var current_colour = "None"
