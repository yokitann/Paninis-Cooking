extends Camera2D

@export var tilemap: TileMap
@export var follow_point: Node2D

func _ready():
	#camera2d doesn't have to change the limit each time I alter the map
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.cell_quadrant_size
	var world_size = map_rect.size * tile_size
	limit_right = world_size.x
	limit_bottom = world_size.y

func _process(delta):
	global_position = follow_point.global_position 
