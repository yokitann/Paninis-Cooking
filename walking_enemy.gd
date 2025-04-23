extends CharacterBody2D

var direction: Vector2 = Vector2.RIGHT
var speed: float = 50.0

@onready var ledge_check_right = $LedgeCheckRight
@onready var ledge_check_left = $LedgeCheckLeft
@onready var sprite = $AnimatedSprite2D 

func _ready():
	sprite.play("Walking")

func _physics_process(delta: float) -> void:
	var found_wall: bool = is_on_wall()
	var found_ledge: bool = not ledge_check_right.is_colliding() or not ledge_check_left.is_colliding()
	
	if found_wall or found_ledge:
		direction *= -1
		sprite.flip_h = direction.x < 0

	velocity = direction * speed
	move_and_slide()
