extends Panel

var replies: Array = ["comment111111111111", "comment2"]
static var x = 1

@onready var replies_m = $MarginContainer/VBoxContainer/Replies
@onready var text = $MarginContainer/VBoxContainer/Text

func _ready():
	x += 1
	if x == 2:
		for c in replies:
			print("X")
			var com = preload("res://comment.tscn").instantiate()
			replies_m.add_child(com)
			com.text.text = c
			
