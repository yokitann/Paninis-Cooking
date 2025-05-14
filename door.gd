extends Area2D

@export var target_scene: PackedScene  
@onready var transition = get_node("/root/TransitionLayer")

func _on_body_entered(body: Node):
	if body is player:  
		await transition.fade_to_black()
		get_tree().change_scene_to_packed(target_scene)
		await transition.fade_from_black()
		  
