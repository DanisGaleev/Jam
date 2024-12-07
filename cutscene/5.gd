extends Node2D




func _on_fifth_button_pressed() -> void:
	get_tree().change_scene_to_file("res://6.tscn")


func _on_fifth_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://6.tscn")
