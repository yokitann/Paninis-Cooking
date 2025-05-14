class_name Startmenu extends Control

@onready var start_game_button = %StartGameButton
#@onready var play_button = %PlayButton
#@onready var quit_button = %QuitButton
@onready var title = %Title

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

#func _ready():
	#play_button.grab_focus()

#func _on_start_game_button_pressed():
	#get_tree().change_scene_to_file("res://game.tscn")

#func _on_end_game_button_pressed():
	#get_tree().quit()
