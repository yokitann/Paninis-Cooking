class_name BaseScene extends Node

@onready var entrance_spawn: Node2D = $EntranceSpawn
@onready var default_story_player: Player = $StoryPlayerMiffy
var story_player: Player

func _ready():
	if scene_manager.story_player:
		if is_instance_valid(default_story_player):
			default_story_player.queue_free()

		story_player = scene_manager.story_player
		add_child(story_player)
	else:
		story_player = default_story_player

	player_position()

func player_position() -> void: 
	for entrance in entrance_spawn.get_children():
		if entrance is Marker2D and entrance.name.to_lower() == "appearance":
			story_player.global_position = entrance.global_position
