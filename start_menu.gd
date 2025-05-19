extends Control

func _on_start_game_pressed() -> void:
	print("start")
	get_tree().change_scene_to_file("res://scene/game.tscn")

func _on_quit_pressed() -> void:
	print("quit")
	get_tree().quit()
