extends Area2D

#do this to every item to collect
@export var itemRes: InventoryItem

#do this every item to collect
func collect(inventory: Inventory):
	inventory.insert(itemRes)
	queue_free()
