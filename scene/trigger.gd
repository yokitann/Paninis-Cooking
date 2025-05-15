class_name Trigger extends Area2D

var story_player = Player
@export var connected_scene : String
@onready var sound = preload("res://whoosh-313320.mp3")

func _on_body_entered(body) -> void:
	if body is Player:
		scene_manager.change_scene(get_owner(), connected_scene)
		AudioPlayer.transition_sound(sound)
