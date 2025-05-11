extends RigidBody2D

@export var cat_of_loot = -1
var player
var is_openned = false

func get_player() -> Player:
	var player = get_node_or_null("/root/MainMenu/Player")
	if player and is_instance_valid(player):
		return player as Player
	return null

func benefit():
	player = get_player()
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
		AchievementManager.unlock("greate_treasures")

func _on_timer_timeout() -> void:
	player.delete_protection()
	%Manager.hide_shield()
