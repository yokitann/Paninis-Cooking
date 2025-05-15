extends Control

@onready var inventory: Inventory = preload("res://player_inventory.tres")
@onready var slots: Array = %BoxContainer.get_children()

func _ready():
	inventory.updated.connect(update)
	update()

func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])

var is_close: bool = false

func open():
	visible = true
	is_close = true

func close():
	visible = false 
	is_close = false
