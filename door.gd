extends Area2D

@export var target_scene: PackedScene  


func _on_body_entered(body: Node):
	if body is player:  
		get_tree().change_scene_to_packed(target_scene)  
