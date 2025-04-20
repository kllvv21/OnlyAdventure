extends Node
class_name AudioManager

const MUSIC_BUS := 1
const SFX_BUS := 2

func set_volume(bus_index: int, value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func get_volume(bus_index: int) -> float:
	return db_to_linear(AudioServer.get_bus_volume_db(bus_index))

func mute(bus_index: int, should_mute: bool) -> void:
	AudioServer.set_bus_mute(bus_index, should_mute)

func is_muted(bus_index: int) -> bool:
	return AudioServer.is_bus_mute(bus_index)
