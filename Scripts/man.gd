extends Node

var coins = 0
var lives = 3

@onready var lab = $CanvasLayer/Label
var shield
@export var health : Array[Node]

func decrease_health():
	lives -= 1
	for h in 3:
		if (lives > h):
			health[h].show()
		else:
			health[h].hide()
	if lives == 0:
		ProgressManager.increase_death()
		get_tree().reload_current_scene()
		AchievementManager.unlock("first_death")

func increase_health():
	if lives < 3:
		lives += 1
	for h in 3:
		if (lives > h):
			health[h].show()
		else:
			health[h].hide()

func add_coin():
	coins += 1
	lab.text = ' ' + str(coins)

func increase_coins():
	coins += 5
	lab.text = ' ' + str(coins)

func show_shield():
	$CanvasLayer/Protection.show()
	print("Защита")

func hide_shield():
	$CanvasLayer/Protection.hide()
	#pass
	
