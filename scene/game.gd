extends BaseScene

@onready var camera = %Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.play_music_level()
	super()
	camera.follow_point = story_player
 
