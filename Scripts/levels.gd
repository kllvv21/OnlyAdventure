extends Control

var players = {
	"Chill Girlie": "res://Scenes/chill-girlie.tscn",
	"Disco Boy": "res://Scenes/disco-boy.tscn",
	"Sugar Girl": "res://Scenes/sugar-girl.tscn"
}

var current_player_node: Node = null
var player_position: Vector2 = Vector2.ZERO
var is_fast = true
var ach_timer: Timer

func _ready() -> void:
	is_fast = true
	ach_timer = Timer.new()
	add_child(ach_timer)
	ach_timer.timeout.connect(_on_ach_timer_timeout)
	ach_timer.start(15.0)
	if has_node("Player"):
		current_player_node = $Player
		player_position = current_player_node.global_position
	change_player(ProgressManager.get_skin())

func change_player(player_name: String) -> void:
	if not players.has(player_name):
		return

	if is_instance_valid(current_player_node) and current_player_node is Node2D:
		player_position = current_player_node.global_position
		player_position.y = player_position.y - 20
		current_player_node.queue_free()
		await get_tree().process_frame 

	var player_scene = load(players[player_name])
	if player_scene == null:
		return

	var new_player = player_scene.instantiate()
	if not new_player is Node2D:
		return

	add_child(new_player)
	current_player_node = new_player
	new_player.global_position = player_position

	new_player.name = "Player"
	var camera = new_player.get_node("Camera2D")
	camera.enabled = true
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		if ProgressManager.get_coins() >= 100:
			AchievementManager.unlock("moneybag")
		if is_fast:
			AchievementManager.unlock("no_time_to_waste")
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level2.tscn")
		


func _on_end_level_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		if ProgressManager.get_coins() >= 100:
			AchievementManager.unlock("moneybag")
		if is_fast:
			AchievementManager.unlock("no_time_to_waste")
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level3.tscn")


func _on_end_level_3_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		if ProgressManager.get_coins() >= 100:
			AchievementManager.unlock("moneybag")
		if is_fast:
			AchievementManager.unlock("no_time_to_waste")
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level4.tscn")


func _on_end_level_4_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		if ProgressManager.get_coins() >= 100:
			AchievementManager.unlock("moneybag")
		if is_fast:
			AchievementManager.unlock("no_time_to_waste")
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level5.tscn")


func _on_end_level_5_body_entered(body: Node2D) -> void:
	if body is Player:
		var coins_to_add = int(%Manager/CanvasLayer/Label.text)
		ProgressManager.add_coins(coins_to_add)
		if ProgressManager.get_coins() >= 100:
			AchievementManager.unlock("moneybag")
		if is_fast:
			AchievementManager.unlock("no_time_to_waste")
		ProgressManager.set_level()
		get_tree().change_scene_to_file("res://Scenes/level6.tscn")

func _on_end_level_6_body_entered(body: Node2D) -> void:
	if is_fast:
			AchievementManager.unlock("no_time_to_waste")
	AchievementManager.unlock("true_legend")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/levels_scene.tscn")


func _on_ach_timer_timeout():
	is_fast = false
