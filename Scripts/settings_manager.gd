extends Node
class_name SettingsManager

const SAVE_PATH := "user://settings.cfg"

func load_settings() -> Dictionary:
	var default_settings = {
		"volume": 0.8,
		"music_muted": false,
		"sfx_muted": false,
		"joystick_position": "left"
	}
	if not FileAccess.file_exists("user://settings.cfg"):
		return default_settings
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var data = file.get_var()
	file.close()
	return data

func save_settings(data: Dictionary) -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(data)
	file.close()

func update_setting(key: String, value: Variant) -> void:
	var data = load_settings()
	data[key] = value
	save_settings(data)

func get_setting(key: String, default: Variant = null) -> Variant:
	var data = load_settings()
	if data.has(key):
		return data[key]
	else:
		return default
