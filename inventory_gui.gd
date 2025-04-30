extends Control

@onready var inventory: Inventory = preload("res://player_inventory.tres")
@onready var slots: Array = %BoxContainer.get_children()

func _ready():
	inventory.updated.connect(update)
	update()

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

var is_open: bool = false

func open():
	visible = true
	is_open = true

func close():
	visible = false 
	is_open = false
