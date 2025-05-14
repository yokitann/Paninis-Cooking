extends Node2D

func _ready() -> void:
	#if scene_manager has player
	if scene_manager.player: 
		#then add player as a child
		add_child(scene_manager.player)
