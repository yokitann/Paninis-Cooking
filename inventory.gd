class_name Inventory extends Resource

signal updated

@export var slots: Array[InventorySlot]

func insert(item: InventoryItem):
	var item_slots = slots.filter(func(slot): return slot.item == item && slot.amount < slot.item.max)
	if !item_slots.is_empty():
		item_slots[0].amount += 1
	else:
		var empty_slots = slots.filter(func(slot): return slot.item == null)
		if !empty_slots.is_empty():
			empty_slots[0].item = item 
			empty_slots[0].amount = 1
	
	updated.emit()
