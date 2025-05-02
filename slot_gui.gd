extends Panel

@onready var background: Sprite2D = %background
@onready var item_sprite: Sprite2D = %items
@onready var amount_label: Label = %Label

func update(slot: InventorySlot):
	if !slot.item:
		background.frame = 0
		item_sprite.visible = false 
		amount_label.visible = false
	else:
		background.frame = 1
		item_sprite.visible = true
		item_sprite.texture = slot.item.texture
		amount_label.visible = true 
		amount_label.text = str(slot.amount) 
