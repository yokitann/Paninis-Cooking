extends Node2D

@onready var entrance_spawn: Node2D = $Entrance
@onready var default_story_player: Player = $StoryPlayerMiffy
var story_player: Player

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.LIGHT_SKY_BLUE)
