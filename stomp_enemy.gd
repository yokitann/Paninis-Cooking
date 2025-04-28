extends Node2D

enum State { HOVER, FALL, LAND, RISE }

var state: State = State.HOVER
var start_position: Vector2
var sprite_height = sprite.texture.get_height() * sprite.scale.y
@onready var sprite: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer
@onready var raycast: RayCast2D = $RayCast2D

func _ready():
	start_position = global_position

func _physics_process(delta: float) -> void:
	match state:
		State.HOVER:
			hover_state()
		State.FALL:
			fall_state(delta)
		State.LAND:
			land_state()
		State.RISE:
			rise_state(delta)

func hover_state() -> void:
	state = State.FALL

func fall_state(delta) -> void:
	position.y += 100 * delta 
	if raycast.is_colliding():
		var collision_point: Vector2 = raycast.get_collision_point()
		global_position.y = collision_point.y - sprite_height / 2
		state = State.LAND

func land_state() -> void:
	state = State.RISE

func rise_state(delta) -> void:
	position.y = move_toward(position.y, start_position.y, 10 * delta)
	if position.y == start_position.y:
		state = State.HOVER
