extends CharacterBody2D

var player_detected = false 

func _ready() -> void:
	var detection_area = %Detection
	detection_area.body_entered.connect(_on_body_entered)
	detection_area.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":  
		player_detected = true

func _on_body_exited(body: Node) -> void:
	if body.name == "Player": 
		player_detected = false

func _unhandled_input(event: InputEvent) -> void:
	if player_detected and event.is_action_pressed("talk"):
		get_tree().change_scene_to_file("res://start_menu.tscn") #change the scene later (replace it with dialogue onece done)
