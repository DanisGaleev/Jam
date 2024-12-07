extends Node2D



func _on_third_button_pressed() -> void:
	get_tree().change_scene_to_file("res://4.tscn")


func _on_third_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://4.tscn")
