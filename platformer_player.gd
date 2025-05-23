extends CharacterBody2D
class_name player

const SPEED = 150.0
const JUMP_VELOCITY = -200.0
const DOUBLE_JUMP_VELOCITY = -250.0
const JUMP_BUFFER_TIME = 0.15
const COYOTE_TIME = 0.1
const WALL_JUMP_FORCE = Vector2(150, -200)
const WALL_JUMP_TIME = 0.2

var double_jump = 1
var jump_buffer_timer = 0.0
var coyote_time_timer = 0.0
var wall_jump_cooldown = 0.0

@onready var _animated_miffy = %Miffy
@onready var collect_sound = %AudioStreamPlayer2D
@onready var jump_sound = %JumpSound
@onready var death_sound = %DeathSound
@export var inventory: Inventory

func _ready():
	%Detection.area_entered.connect(_on_detection_area_entered)
	
func _on_detection_area_entered(area: Area2D) -> void:
	if area.has_method("collect"):
		print("yess")
		area.collect(inventory)
		print("lol")
		collect_sound.play()
	else:
		print("no")

#func _on_body_entered(area) -> void:
	#if area.has_method("collect"):
		#area.collect(inventory)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		coyote_time_timer += delta
	else:
		coyote_time_timer = 0.0
		double_jump = 1

	if wall_jump_cooldown > 0:
		wall_jump_cooldown -= delta

	if Input.is_action_just_pressed("move_up"):
		jump_buffer_timer = JUMP_BUFFER_TIME

	if jump_buffer_timer > 0:
		jump_buffer_timer -= delta

	var on_wall = is_on_wall()
	var wall_normal = get_wall_normal()

	if (is_on_floor() or coyote_time_timer < COYOTE_TIME) and jump_buffer_timer > 0:
		velocity.y = JUMP_VELOCITY
		jump_buffer_timer = 0
		coyote_time_timer = 0
		jump_sound.play()
	elif on_wall and jump_buffer_timer > 0 and wall_jump_cooldown <= 0:
		velocity.y = WALL_JUMP_FORCE.y
		velocity.x = wall_normal.x * WALL_JUMP_FORCE.x
		wall_jump_cooldown = WALL_JUMP_TIME
		double_jump = 1
		jump_buffer_timer = 0
		jump_sound.play()
	elif not is_on_floor() and jump_buffer_timer > 0 and double_jump > 0:
		velocity.y = DOUBLE_JUMP_VELOCITY
		double_jump -= 1
		jump_buffer_timer = 0
		jump_sound.play()


	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		_animated_miffy.flip_h = false
	elif direction < 0:
		_animated_miffy.flip_h = true

	#ignore 
	#if direction == 0:
		#_animated_miffy.play("front")
	#else:
		#_animated_miffy.play("run")

	if velocity.y < 0: #and not is_on_floor():
		_animated_miffy.play("jump")
	elif direction == 0:
		_animated_miffy.play("front")
	else:
		_animated_miffy.play("run")

	velocity.x = direction * SPEED if direction else move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
