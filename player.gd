class_name Player extends CharacterBody2D

@onready var _character: Sprite2D = %Miffy
@onready var _miffy: AnimatedSprite2D = %Miffy2

const miffy_back = preload("res://Miffy_back.png")
const miffy_front = preload("res://Miffy_front.png")
const miffy_left = preload("res://Miffy_left_walk.png")
const miffy_right = preload("res://Miffy_right.png")

const up_right = Vector2.UP + Vector2.RIGHT
const up_left = Vector2.UP + Vector2.LEFT
const down_right = Vector2.DOWN + Vector2.RIGHT 
const down_left = Vector2.DOWN + Vector2.LEFT

var speed := 400.0 

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = speed * direction
	#update_animation(direction)
	move_and_slide()
	#var direction_discrete := direction.sign()
	#match direction_discrete:
		#Vector2.RIGHT:
			#_character.texture = miffy_right 
		#Vector2.LEFT:
			#_character.tecture = miffy_left
		#Vector2.UP: 
			#_character.texture = miffy_back
		#Vector2.DOWN:
			#_character.texture = miffy_front
			

#func update_animation(input_axis):
	#if Input.get_vector("move_up"):
		#_miffy.play("front")
