extends Area2D

@onready var checkpint_manager = %CheckpointManager

var is_activated = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player and not is_activated:
		is_activated = true
		checkpint_manager.last_location = $RespawnPoint.global_position
		$AnimatedSprite2D.play('flag_up')

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "flag_up":
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play('wind')
