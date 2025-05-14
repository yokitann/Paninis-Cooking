class_name Trigger extends Area2D

var story_player = Player
@export var connected_scene : String

func _on_body_entered(body) -> void:
	if body is Player:
		scene_manager.change_scene(get_owner(), connected_scene)
