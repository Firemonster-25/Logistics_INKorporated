extends Node2D

@export var level_id: int

@onready var player = $Player
@onready var camera_2d = $Camera2D

var x_ratio: float
var y_ratio: float


func _ready():
	SaveSystem.save(level_id)
	# Transfers level specific information to game manager
	GameManager.next_level = level_id + 1
	GameManager.level = get_node(get_path())
	GameManager.player = player
	GameManager.current_color = ""
	GameManager.activated_objects.clear()
	if GameManager.previous_respawn_point:
		player.position = GameManager.previous_respawn_point
		camera_2d.position = GameManager.previous_respawn_point
		GameManager.previous_respawn_point = false
	else:
		camera_2d.position = player.position

func _physics_process(delta):
	reset_level()
	
	smooth_camera()



func smooth_camera():
	# Makes the camera smoothly follow the player
	x_ratio = abs((camera_2d.position.x - player.position.x)/75)
	y_ratio = abs((camera_2d.position.y - player.position.y)/75)
	camera_2d.position.x = move_toward(camera_2d.position.x, player.position.x, 3 * clampf(x_ratio, 0.75, 10))
	camera_2d.position.y = move_toward(camera_2d.position.y, player.position.y, 3 * clampf(y_ratio, 0.75, 10))

func reset_level():
	if Input.is_action_just_pressed("reset"):
		GameManager.previous_respawn_point = GameManager.respawn_point
		get_tree().reload_current_scene()
