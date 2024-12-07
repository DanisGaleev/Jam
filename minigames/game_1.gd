extends Panel

@export var correct_order: Array[String] = []

# Узлы для взаимодействия
@onready var image_list = $MarginContainer/ScrollContainer/HBoxContainer
@onready var slots = $MarginContainer/MarginContainer/GridContainer

var selected_image: TextureButton = null

func _ready():
	setup_images()
	connect_signals()

func setup_images():
	for i in image_list.get_children():
		if i is TextureButton:
			i.disabled = false

func connect_signals():
	for button in image_list.get_children():
		if button is TextureButton:
			button.pressed.connect(_on_image_selected.bind(button))

	for slot in slots.get_children():
		if slot is TextureButton:
			slot.pressed.connect(_on_slot_selected.bind(slot))

func _on_image_selected(button: TextureButton):
	selected_image = button

func _on_slot_selected(slot: TextureButton):
	if selected_image:
		if slot.texture_normal:
			var temp = slot.texture_normal
			slot.texture_normal = selected_image.texture_normal
			selected_image.texture_normal = temp
				
		else:	
			slot.texture_normal = selected_image.texture_normal
			for image in image_list.get_children():
				if image.texture_normal == selected_image.texture_normal:
					image.texture_normal = null
					break
		selected_image = null
	else:
		for image in image_list.get_children():
			if image.texture_normal == null:
				image.texture_normal = slot.texture_normal
				slot.texture_normal = null
				break
	var arr: Array[String] = []
	for slt in slots.get_children():
		if slt.texture_normal != null:
			arr.append((slt as TextureButton).texture_normal.resource_path)
	
	var flag = true
	if len(arr) == len(correct_order):
		for i in range(12):
			flag = flag and (arr[i] == correct_order[i])
	if flag:
		pass
		
