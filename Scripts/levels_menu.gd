extends CanvasLayer

@export var buttons_array: Array[Node]

func _ready() -> void:
	for h in buttons_array.size():
		if h >= ProgressManager.get_level():
			buttons_array[h].disabled = true
			buttons_array[h].focus_mode = 0

func _on_level_1_pressed() -> void:
	$"../AudioClick".play()
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")

func _on_level_2_pressed() -> void:
	$"../AudioClick".play()
	get_tree().change_scene_to_file("res://Scenes/level2.tscn")

func _on_level_3_pressed() -> void:
	$"../AudioClick".play()
	get_tree().change_scene_to_file("res://Scenes/level3.tscn")

func _on_level_4_pressed() -> void:
	$"../AudioClick".play()
	get_tree().change_scene_to_file("res://Scenes/level4.tscn")

func _on_level_5_pressed() -> void:
	$"../AudioClick".play()
	get_tree().change_scene_to_file("res://Scenes/level5.tscn")

func _on_level_6_pressed() -> void:
	$"../AudioClick".play()
	get_tree().change_scene_to_file("res://Scenes/level6.tscn")
