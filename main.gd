extends Control


func _ready():
	var file = FileAccess.open("res://themas.json", FileAccess.READ)
	var json = JSON.new()
	json.parse(file.get_as_text())
	
	for post in json.data.posts:
		var pst = preload("res://thema.tscn").instantiate()
		
		get_node('MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer').add_child(pst)
		
		pst.author.text = post.author
		pst.date.text = post.publication_date
		pst.title.text = post.title
		pst.body.text = post.body
		pst.views.text = str(post.views)
