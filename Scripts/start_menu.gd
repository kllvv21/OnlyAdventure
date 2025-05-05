extends Control



func _on_play_pressed() -> void:
	$AudioClick.play()
	get_tree().change_scene_to_file("res://Scenes/level" + str(ProgressManager.get_level()) + ".tscn")

func _on_settings_pressed() -> void:
	$AudioClick.play()
	$Settings/ParallaxBackground.show()
	$Settings/SettingsUI.show()


func _on_exit_pressed() -> void:
	$AudioClick.play()
	get_tree().quit()
