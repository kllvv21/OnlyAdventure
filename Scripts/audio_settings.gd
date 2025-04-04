extends Control


func _ready() -> void:
	$VBoxContainer/HSlider.value = db_to_linear(AudioServer.get_bus_volume_db(1))

func _on_h_slider_value_changed(value: float) -> void:
	if !$VBoxContainer/HBoxContainer/MusicButton.button_pressed:
		AudioServer.set_bus_volume_db(1, linear_to_db($VBoxContainer/HSlider.value))

func _on_sfx_buttton_pressed() -> void:
	if $VBoxContainer/HBoxContainer/SFXButton.button_pressed:
		AudioServer.set_bus_volume_db(2, linear_to_db(0))
	else:
		AudioServer.set_bus_volume_db(2, -10)

func _on_music_button_pressed() -> void:
	if $VBoxContainer/HBoxContainer/MusicButton.button_pressed:
		AudioServer.set_bus_volume_db(1, linear_to_db(0))
	else:
		AudioServer.set_bus_volume_db(1, linear_to_db($VBoxContainer/HSlider.value))
