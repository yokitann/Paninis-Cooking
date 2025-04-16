extends CharacterBody2D

var player_detected = false 
@onready var _player = %Player

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
const DialogueBalloon = preload("res://dialogue/balloon.tscn")
#dialogue stuff

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
		var dialogue: Node = DialogueBalloon.instantiate()
		get_tree().current_scene.add_child(dialogue)
		dialogue.start(dialogue_resource, dialogue_start)
		_player.can_move = false
		#changes to dialogue manager
		# (OLD SCRIPT) DialogueManager.show_example_dialogue_balloon(load("res://dialogue2.dialogue"), "start")
		return
	
