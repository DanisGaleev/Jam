extends Panel

@onready var author = $MarginContainer/VBoxContainer/HBoxContainer2/Author
@onready var date = $MarginContainer/VBoxContainer/HBoxContainer2/Date
@onready var title = $MarginContainer/VBoxContainer/Title
@onready var body = $MarginContainer/VBoxContainer/Body
@onready var image: TextureRect = $MarginContainer/VBoxContainer/Image
@onready var views = $MarginContainer/VBoxContainer/HBoxContainer/Views

var comments: Array = []

func _on_comments_pressed():
	Main.theme_title = title.text
	Main.theme_body = body.text
	get_tree().change_scene_to_file("res://thema/theme_view.tscn")
