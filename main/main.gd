extends Control


func _ready():
	var file = FileAccess.open("res://thema/themas.json", FileAccess.READ)
	var json = JSON.new()
	json.parse(file.get_as_text())
	
	for post in json.data.posts:
		var pst = preload("res://thema/thema.tscn").instantiate()
		
		get_node('MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer').add_child(pst)
		
		pst.author.text = post.author
		pst.date.text = post.publication_date
		pst.title.text = post.title
		pst.body.text = post.body
		if post.photo:
			pst.image.texture = load(post.photo)
			pst.image.custom_minimum_size = Vector2(1000, 0)
			pst.image.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			pst.image.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
			pst.image.size_flags_stretch_ratio = 8
			pst.custom_minimum_size.y = 648
		pst.views.text = str(post.views)
		for comment in post.comments:
			var comment_label = Label.new()
			comment_label.text = comment.user_name + ": " + comment.text
			pst.comments_container.add_child(comment_label)
	
		pst.send_button.connect("pressed", Callable(self, "_on_send_comment").bind(post, pst), 3)


func _on_send_comment(post: Dictionary, post_node: Node): 
	var input_field = post_node.comment_input
	var comment_text = input_field.text.strip_edges()
	
	if comment_text == "":
		print("Комментарий не может быть пустым!")
		return

	var new_comment = {
		"user_name": "USER", 
		"comment_date": "date", 
		"text": comment_text
	}
	
	post.comments.append(new_comment)

	var comment_label = Label.new()
	comment_label.text = new_comment.user_name + ": " + new_comment.text
	post_node.comments_container.add_child(comment_label)
	input_field.text = ""
