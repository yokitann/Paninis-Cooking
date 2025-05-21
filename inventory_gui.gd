extends Control

@onready var inventory: Inventory = preload("res://player_inventory.tres")
@onready var slots: Array = %BoxContainer.get_children()

func _ready():
	 # connect the inventory's update signal to refresh the UI
	inventory.updated.connect(update) 
	update() 

func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])
		# set each UI slot to match the inventory data

#toggl
var is_close: bool = false

func open():
	visible = true
	is_close = true

func close():
	visible = false 
	is_close = false
