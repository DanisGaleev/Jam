extends Panel

@onready var author = $MarginContainer/VBoxContainer/HBoxContainer2/Author
@onready var date = $MarginContainer/VBoxContainer/HBoxContainer2/Date
@onready var title = $MarginContainer/VBoxContainer/Title
@onready var body = $MarginContainer/VBoxContainer/Body
@onready var image = $MarginContainer/VBoxContainer/Image
@onready var views = $MarginContainer/VBoxContainer/HBoxContainer/Views

@onready var comments_container = $MarginContainer/VBoxContainer/comments_container
@onready var comment_input = $MarginContainer/VBoxContainer/comment_input
@onready var send_button = $MarginContainer/VBoxContainer/send_button

var comments: Array = []

func _on_comments_pressed():
	Main.theme_title = title.text
	Main.theme_body = body.text
	get_tree().change_scene_to_file("res://thema/theme_view.tscn")

func _on_send_comment():
	var comment_text = comment_input.text.strip_edges()
	if comment_text == "":
		print("Комментарий не может быть пустым!")
		return

	var comment = {
		"user_name": "USER",  
		"comment_date": "12:22",
		"text": comment_text
	}
	comments.append(comment)

	var comment_label = Label.new()
	comment_label.text = comment.user_name + ": " + comment.text
	comments_container.add_child(comment_label)
	
	
	comment_input.text = ""
	print("Комментарий добавлен!")
