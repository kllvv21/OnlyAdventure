extends Area2D

@onready var timer = $Timer
@onready var checkpoint_manager = %CheckpointManager
@onready var player = $"../../Player"

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		#ProgressManager.increase_death()
		%Manager.decrease_health()
		timer.start()

func _on_timer_timeout() -> void:
	player.position = checkpoint_manager.last_location
	player.velocity = Vector2(0,0)
	#get_tree().reload_current_scene()
