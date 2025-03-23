class_name Hit extends Node

@onready var man = get_tree().root.find_child("Manager", true, false)
@onready var parent: CharacterBody2D = get_parent()


func _on_node_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		var y_delta = parent.position.y - body.position.y
		var x_delta = body.position.x - parent.position.x
		if y_delta > 18:
			parent.queue_free()
			body.bounce()
		else:
			man.decrease_health()
			if (x_delta < 0):
				body.jump_side(-800)
			else:
				body.jump_side(800)
