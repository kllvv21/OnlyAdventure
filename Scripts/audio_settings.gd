extends CanvasLayer

@onready var volume_slider = $VBoxContainer/HSlider
@onready var music_button = $VBoxContainer/HBoxContainer/MusicButton
@onready var sfx_button = $VBoxContainer/HBoxContainer/SFXButton
@onready var joystick_side_button = $VBoxContainer/HBoxContainer3/SideButton
@onready var audio_click = $"../AudioClick"

var audio_manager: AudioManager
var control_manager: ControlManager
var settings_manager: SettingsManager

var side


func _ready() -> void:
	audio_manager = AudioManager.new()
	settings_manager = SettingsManager.new()
	add_child(audio_manager)
	add_child(settings_manager)

	var settings = settings_manager.load_settings()

	volume_slider.value = settings["volume"]
	music_button.button_pressed = not settings["music_muted"]
	sfx_button.button_pressed = not settings["sfx_muted"]
	joystick_side_button.button_pressed = settings["joystick_position"] == "right"
	
	side = settings["joystick_position"]
	
	audio_manager.set_volume(AudioManager.MUSIC_BUS, volume_slider.value)
	audio_manager.mute(AudioManager.MUSIC_BUS, not music_button.button_pressed)
	audio_manager.mute(AudioManager.SFX_BUS, not sfx_button.button_pressed)
	
func _on_side_button_toggled(toggled_on: bool) -> void:
	side = "right" if toggled_on else "left"
	settings_manager.update_setting("joystick_position", side)
	ControlManager.apply_joystick_settings()
	
func _on_h_slider_value_changed(value: float) -> void:
	if music_button.button_pressed:
		audio_manager.set_volume(AudioManager.MUSIC_BUS, value)
	settings_manager.update_setting("volume", volume_slider.value)

func _on_music_button_toggled(toggled_on: bool) -> void:
	audio_manager.mute(AudioManager.MUSIC_BUS, not toggled_on)
	if toggled_on:
		audio_manager.set_volume(AudioManager.MUSIC_BUS, volume_slider.value)
	settings_manager.update_setting("music_muted", not music_button.button_pressed)

func _on_sfx_button_toggled(toggled_on: bool) -> void:
	audio_manager.mute(AudioManager.SFX_BUS, not toggled_on)
	settings_manager.update_setting("sfx_muted", not sfx_button.button_pressed)

func _on_button_pressed() -> void:
	audio_click.play()
	$"../../Settings/ParallaxBackground".hide()
	$"../../Settings/SettingsUI".hide()


func _on_reset_button_pressed() -> void:
	ProgressManager.reset_progress()
	settings_manager.reset_settings()
	
	var settings = settings_manager.load_settings()

	volume_slider.value = settings["volume"]
	music_button.button_pressed = not settings["music_muted"]
	sfx_button.button_pressed = not settings["sfx_muted"]
	joystick_side_button.button_pressed = settings["joystick_position"] == "right"
	
	side = settings["joystick_position"]
	
	audio_manager.set_volume(AudioManager.MUSIC_BUS, volume_slider.value)
	audio_manager.mute(AudioManager.MUSIC_BUS, not music_button.button_pressed)
	audio_manager.mute(AudioManager.SFX_BUS, not sfx_button.button_pressed)
