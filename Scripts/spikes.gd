extends Node2D

@onready var man = get_tree().root.find_child("Manager", true, false)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		if !body.is_protected:
			var x_delta = body.position.x - position.x
			man.decrease_health()
			if (x_delta < 0):
				body.jump_side(-800)
			else:
				body.jump_side(800)
