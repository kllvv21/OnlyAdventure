extends RigidBody2D

@onready var player = $"../Player" as Player
var is_openned = false

func benefit():
	var num = randi() % 2
	if num == 0:
		%Manager.increase_health()
	if num == 1:
		%Manager.increase_coins()
	else:
		player.protection()
	
	
func _on_hit_area_area_entered(area: Area2D) -> void:
	if area is CharacterAttack and not is_openned:
		is_openned = true
		benefit()
		$AnimatedSprite2D.play("openning")
