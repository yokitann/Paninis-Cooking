class_name Startmenu extends Control

@onready var start_game_button = %StartGameButton
@onready var title = %Title


func _ready():
	start_game_button.grab_focus()

func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_end_game_button_pressed():
	get_tree().quit()
