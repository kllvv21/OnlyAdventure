extends Area2D

@onready var player: Player = $"../Player"


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player.is_on_ice = true
	


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player.is_on_ice = false
