extends Node

@onready var player: Player = $"../Player"

var last_location 

func _ready() -> void:
	last_location = player.global_position
