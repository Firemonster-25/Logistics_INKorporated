extends Node2D

@export var level_id: String
@export var default_respawn_point: Vector2
@export var next_level: String

@onready var player = $Player
@onready var pause_menu = $PauseMenu
@onready var camera_2d = $Camera2D

var x_ratio: float
var y_ratio: float
func _ready():
	game_manager.respawn_point = default_respawn_point
	game_manager.next_level = next_level
	game_manager.level = get_node(get_path())
	game_manager.player = player
	game_manager.current_colour = "None"
	camera_2d.position = player.position

func _physics_process(delta):
	smooth_camera()

func smooth_camera():
	x_ratio = abs((camera_2d.position.x - player.position.x)/75)
	y_ratio = abs((camera_2d.position.y - player.position.y)/75)
	camera_2d.position.x = move_toward(camera_2d.position.x, player.position.x, 3 * clampf(x_ratio, 0.75, 10))
	camera_2d.position.y = move_toward(camera_2d.position.y, player.position.y, 3 * clampf(y_ratio, 0.75, 10))
