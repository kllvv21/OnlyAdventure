extends Area2D

@onready var checkpoint_manager = %CheckpointManager
var timer: Timer
var player

func get_player() -> Player:
	var player = get_node_or_null("/root/MainMenu/Player")
	if player and is_instance_valid(player):
		return player as Player
	return null

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		%Manager.decrease_health()
		timer.start(0.5)

func _on_timer_timeout() -> void:
	player = get_player()
	player.position = checkpoint_manager.last_location
	player.velocity = Vector2(0,0)







	
