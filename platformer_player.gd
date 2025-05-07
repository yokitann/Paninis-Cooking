extends CharacterBody2D
class_name player

const SPEED = 150.0
const JUMP_VELOCITY = -200.0

@onready var _animated_miffy = %Miffy
@export var inventory: Inventory

func _ready():
	%Detection.area_entered.connect(_on_detection_area_entered)
	
func _on_detection_area_entered(area: Area2D) -> void:
	if area.has_method("collect"):
		print("yess")
		area.collect(inventory)
		print("lol")
	else:
		print("no")

#func _on_body_entered(area) -> void:
	#if area.has_method("collect"):
		#area.collect(inventory)

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
