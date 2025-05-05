extends Control


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level" + str(ProgressManager.get_level()) + ".tscn")


func _on_end_level_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level" + str(ProgressManager.get_level()) + ".tscn")


func _on_end_level_3_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level" + str(ProgressManager.get_level()) + ".tscn")


func _on_end_level_4_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level" + str(ProgressManager.get_level()) + ".tscn")


func _on_end_level_5_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level" + str(ProgressManager.get_level()) + ".tscn")
