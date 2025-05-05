extends Area2D

#do this to every item to collect
@export var itemRes: InventoryItem

func _ready() -> void:
	play_floating_animation()

#do this every item to collect
func collect(inventory: Inventory):
	inventory.insert(itemRes)
	queue_free()

func play_floating_animation() -> void:
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_SINE)

	var spam := get_node("Sprite2D")
	var position_offset := Vector2(0.0, 1.0)
	var duration = randf_range(0.8, 1.4)
	tween.tween_property(spam, "position", position_offset, duration)
	tween.tween_property(spam, "position",  -1.0 * position_offset, duration)
	tween.set_loops()
