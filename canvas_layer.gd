extends CanvasLayer

@onready var inventory = %InventoryGUI

func _ready():
	inventory.open()

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		if inventory.is_close:
			inventory.close()
		else:
			inventory.open()
		
