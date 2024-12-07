extends Node2D




func _on_fourth_button_pressed() -> void:
	get_tree().change_scene_to_file("res://5.tscn")


func _on_fourth_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://5.tscn")
