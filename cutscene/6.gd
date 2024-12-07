extends Node2D



func _on_sixth_button_pressed() -> void:
	get_tree().change_scene_to_file("res://1.tscn")


func _on_sixth_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://1.tscn")
