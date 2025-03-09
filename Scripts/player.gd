class_name Player extends CharacterBody2D


@export var SPEED = 260.0
@export var GRAVITY = 900
@export var JUMP_FORCE = 300


func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = velocity.x > 0
		$AnimatedSprite2D.play("walk")
	else:
		velocity.x = lerp(velocity.x, float(0), float(delta * 15))
		$AnimatedSprite2D.stop()
		
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= JUMP_FORCE
		
	move_and_slide()

func bounce():
	velocity.y = -JUMP_FORCE
	
func jump_side(x):
	velocity.y = -JUMP_FORCE
	velocity.x = x 
	
