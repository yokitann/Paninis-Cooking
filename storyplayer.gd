class_name Player extends CharacterBody2D

var max_speed := 200.0
var can_move = true 
@onready var _animated_miffy = %Miffy

func _physics_process(_delta: float) -> void:
	if can_move:
		var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = direction * max_speed
		move_and_slide()
		update_animation(direction)

func update_animation(direction: Vector2) -> void:
	if direction.length() > 0:
		if abs(direction.y) > abs(direction.x):
			#if the vetical movement is greater than the horizontal movement
			if direction.y < 0:
				_animated_miffy.play("back")  
			else:
				_animated_miffy.play("front")  
		else:
			#if the horizontal movement is greater than the vertical movement 
			_animated_miffy.play("run")
			_animated_miffy.flip_h = direction.x < 0
			#flips the animation
	else:
		#no movement
		_animated_miffy.play("front")
		#change to idle once animation is done
