extends Area2D


@export_file("*.tscn") var target_level_path: String

func _on_body_entered(body: Node) -> void:
	if body.name == "player":
		get_tree().change_scene_to_file(target_level_path)
