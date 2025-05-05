extends Area2D

@onready var man: Control = %Manager

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$AnimatedSprite2D.play("collected")
		$CollectedAudio.play()
		man.add_coin()

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "collected":
		queue_free()
