extends Area2D

@export var target_scene: PackedScene  
@onready var transition = get_node("/root/TransitionLayer")
@onready var sound = preload("res://whoosh-313320.mp3")

func _on_body_entered(body: Node):
	if body is Player:  
		AudioPlayer.transition_sound(sound)
		await transition.fade_to_black()
		get_tree().change_scene_to_packed(target_scene)
		await transition.fade_from_black()
		  
