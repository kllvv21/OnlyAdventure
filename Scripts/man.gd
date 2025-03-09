extends Node

var coins = 0
var lives = 3

@onready var lab = $CanvasLayer/Label
@export var health : Array[Node]

func decrease_health():
	lives -= 1
	for h in 3:
		if (lives > h):
			health[h].show()
		else:
			health[h].hide()
	if lives == 0:
		get_tree().reload_current_scene()

func add_coin():
	coins += 1
	lab.text = "Coins: " + str(coins)
