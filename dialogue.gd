extends Control

@onready var _chat: RichTextLabel = %Chat
@onready var next_button: Button = %NextButton

var dialogue: Array[String] = [ 
	"Hello! My name is Remy, the rat!",
	"I will be your chef guide! Are you ready?",
	"Let's Gooooo!!"
]

var current_index := 0 #zero has nothing (keep changing the number to move

func _ready() -> void:
	#show_text()
	next_button.pressed.connect(_continue)

func show_text() -> void:
	var dialogue_item := dialogue[current_index]
	_chat.text = dialogue_item

func _continue() -> void: 
	current_index += 1 #move down from the dialogue 
	if current_index == dialogue.size():
		get_tree().quit
	else:
		show_text()
