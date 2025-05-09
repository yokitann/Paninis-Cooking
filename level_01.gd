extends Node2D


@export var death_y_position : float = 475
@onready var player = get_parent().get_node("player")

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.LIGHT_SKY_BLUE)
