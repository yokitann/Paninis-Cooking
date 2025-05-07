class_name BaseScene extends Node

@onready var player: Player = $Player

func _ready():
	if scene_manager.player:
		if player:
			player.queue_free()
			
		player = scene_manager.player
		add_child(player)
