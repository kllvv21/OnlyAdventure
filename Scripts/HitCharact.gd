class_name Hit extends Node

@onready var man = get_tree().root.find_child("Manager", true, false)
@onready var parent: CharacterBody2D = get_parent()


func _on_node_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		var y_delta = parent.position.y - body.position.y
		var x_delta = body.position.x - parent.position.x
		var jump_threshold = parent.get_node("CollisionShape2D").shape.extents.y * 1.8
		if y_delta > jump_threshold:
			ProgressManager.add_kill()  
			parent.queue_free()
			body.bounce()
		else:
			if  !body.is_protected: 
				man.decrease_health()
				var knockback_direction = -1 if x_delta < 0 else 1
				body.jump_side(800 * knockback_direction)
