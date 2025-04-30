extends Area2D

#do this to every item to collect
@export var itemRes: InventoryItem

#do this every item to collect
func collect(inventory: Inventory):
	inventory.insert(itemRes)
	queue_free()

#func _on_body_entered(body: Node2D) -> void:
		#queue_free() 
