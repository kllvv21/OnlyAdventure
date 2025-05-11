extends Area2D

var player

func get_player() -> Player:
	var player = get_node_or_null("/root/MainMenu/Player")
	if player and is_instance_valid(player):
		return player as Player
	return null

func _on_body_entered(body: Node2D) -> void:
	player = get_player()
	if body is Player:
		player.is_on_ice = true


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player.is_on_ice = false
