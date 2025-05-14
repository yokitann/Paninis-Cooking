extends Area2D

#do this to every item to collect
@export var itemRes: InventoryItem

func _ready() -> void:
	if GlobalVariables.collected_items.has(name):
		queue_free()
	else:
		play_floating_animation()

#do this every item to collect
func collect(inventory: Inventory):
		inventory.insert(itemRes)
		GlobalVariables.add_collected_item(name)  
		#track item as collected
		queue_free()

func play_floating_animation() -> void:
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_SINE)

	var rice := get_node("Sprite2D")
	var position_offset := Vector2(0.0, 3.4)
	var duration = randf_range(0.8, 1.0)
	tween.tween_property(rice, "position", position_offset, duration)
	tween.tween_property(rice, "position",  -1.0 * position_offset, duration)
	tween.set_loops()


#func _on_body_entered(body: Node2D) -> void:
		#queue_free() 
