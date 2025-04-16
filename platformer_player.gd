extends CharacterBody2D
class_name player

const SPEED = 150.0
const JUMP_VELOCITY = -200.0

@onready var _animated_miffy = %Miffy

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		_animated_miffy.flip_h = false
	elif direction < 0:
		_animated_miffy.flip_h = true
	
	if direction == 0:
		_animated_miffy.play("front")
	else:
		_animated_miffy.play("run")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
