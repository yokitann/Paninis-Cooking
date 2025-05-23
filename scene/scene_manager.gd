class_name SceneManager extends Node

#responsible for changing the scene and player 

var story_player: Player
var last_scene_name: String
var scene_path = "res://scene/" #path to scene folder

func change_scene(from, to_scene_name: String) -> void: 
	last_scene_name = from.name #save current scene name. will be used in base_scene
	# from is the old scene #to_scene_name is the new scene
	story_player = from.story_player #saves player from current scene
	
	story_player.get_parent().remove_child(story_player) #removes the player from old scene
	
	var full_path = scene_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)
