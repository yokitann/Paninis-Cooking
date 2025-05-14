extends Node

var collected_items: Array = []

func add_collected_item(item_name: String) -> void:
	if not collected_items.has(item_name):
		collected_items.append(item_name)
