extends Control

func _on_button_pressed() -> void:
	$AudioClick.play()
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")
