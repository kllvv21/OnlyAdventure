extends Control

@onready var panel: Panel = $CanvasLayer/Panel

func _process(_delta: float) -> void:
	var ecs_pressed = Input.is_action_just_pressed('pause')
	if ecs_pressed == true:
		get_tree().paused = true
		panel.show()

func _on_pause_btn_pressed() -> void:
	$AudioClick.play()
	get_tree().paused = true
	panel.show()
	
func _on_resume_pressed() -> void:
	$AudioClick.play()
	panel.hide()
	get_tree().paused = false

func _on_restart_pressed() -> void:
	$AudioClick.play()
	panel.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_settings_pressed() -> void:
	$AudioClick.play()
	$"../Settings/ParallaxBackground".show()
	$"../Settings/SettingsUI".show()

func _on_exit_pressed() -> void:
	$AudioClick.play()
	panel.hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")
