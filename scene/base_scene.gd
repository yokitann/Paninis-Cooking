class_name BaseScene extends Node

@onready var entrance_spawn: Node2D = $EntranceSpawn
@onready var default_story_player: Player = $StoryPlayerMiffy

var story_player: Player
var last_scene = scene_manager.last_scene_name 

func _ready():
	var player
	if scene_manager.story_player:
		if is_instance_valid(default_story_player):
			default_story_player.queue_free() 

		story_player = scene_manager.story_player
		add_child(story_player)
	else:
		story_player = default_story_player

# Only use the player if valid
	if player and is_instance_valid(player):
		player.show()
		player.set_physics_process(true)

	player_position()

func player_position() -> void: 
	if last_scene.is_empty():
		last_scene = "appearance"
	
	for entrance in entrance_spawn.get_children():
		if entrance is Marker2D and entrance.name.to_lower() == "appearance" or entrance.name == last_scene: 
			# "appearance" is a fallback, so when there is nothiing connecting to the scene, it will fall back to appearance
			# the Marker2D should be NAMED AFTER THE SCENE YOU CAME FROM (CAPITALIZE)
			story_player.global_position = entrance.global_position
