extends Node2D

func _on_second_button_pressed() -> void:
	get_tree().change_scene_to_file("res://3.tscn")


func _on_second_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://3.tscn")
