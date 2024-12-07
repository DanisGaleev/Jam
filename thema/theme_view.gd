extends Panel

@onready var theme_title = $MarginContainer/VBoxContainer/Thema/MarginContainer/VBoxContainer/Title
@onready var theme_body = $MarginContainer/VBoxContainer/Thema/MarginContainer/VBoxContainer/Body

func _ready():
	theme_title.text = Main.theme_title
	theme_body.text = Main.theme_body
