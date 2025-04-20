extends RigidBody2D

@export var cat_of_loot = -1
@onready var player = $"../Player" as Player
var is_openned = false

func benefit():
	var num = randi() % 3 if cat_of_loot == -1 else cat_of_loot
	if num == 0:
		%Manager.increase_health()
	elif num == 1:
		%Manager.increase_coins()
	else:
		player.set_protection()
		%Manager.show_shield()
		$Timer.start()

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area is CharacterAttack and not is_openned:
		is_openned = true
		benefit()
		$AnimatedSprite2D.play("openning")

func _on_timer_timeout() -> void:
	player.delete_protection()
	%Manager.hide_shield()
