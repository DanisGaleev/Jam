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
