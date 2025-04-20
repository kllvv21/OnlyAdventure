extends Control
class_name ControlManager

@onready var joystick: Control = %GameControl/CanvasLayer/Joystick

var settings_manager: SettingsManager

func _ready() -> void:
	apply_settings()

func apply_settings():
	settings_manager = SettingsManager.new()
	add_child(settings_manager)
	
	var settings = settings_manager.load_settings()
	
	if settings["joystick_position"] == "left":
		joystick.anchor_left = 0.0
		joystick.anchor_right = 0.0
		joystick.anchor_top = 1.0
		joystick.anchor_bottom = 1.0
		joystick.offset_right = 130
		joystick.offset_bottom = -80
		joystick.offset_left= 130
		joystick.offset_top = -80
	else:
		joystick.anchor_left = 1.0
		joystick.anchor_right = 1.0
		joystick.anchor_top = 1.0
		joystick.anchor_bottom = 1.0
		joystick.offset_right = -130
		joystick.offset_bottom = -80
		joystick.offset_left= -130
		joystick.offset_top = -80
