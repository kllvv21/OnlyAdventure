#class_name Player extends CharacterBody2D
#
#
#@export var SPEED = 260.0
#@export var GRAVITY = 900
#@export var JUMP_FORCE = 350
#
#
#func _physics_process(delta: float) -> void:
	#var direction = Input.get_axis("move_left", "move_right")
	#if direction:
		#velocity.x = direction * SPEED
		#$AnimatedSprite2D.flip_h = velocity.x > 0
		#$AnimatedSprite2D.play("walk")
	#else:
		#velocity.x = lerp(velocity.x, float(0), float(delta * 15))
		#$AnimatedSprite2D.stop()
		#
	#if not is_on_floor():
		#velocity.y += GRAVITY * delta
		#
	#if Input.is_action_just_pressed("ui_up") and is_on_floor():
		#velocity.y -= JUMP_FORCE
		#
	#move_and_slide()
#
#func bounce():
	#velocity.y = -JUMP_FORCE
	#
#func jump_side(x):
	#velocity.y = -JUMP_FORCE
	#velocity.x = x 

class_name Player extends CharacterBody2D

@export var SPEED = 260.0
@export var GRAVITY = 900
@export var JUMP_FORCE = 350

var joystick_vector = Vector2.ZERO  

func _physics_process(delta: float) -> void:

	var keyboard_x = Input.get_axis("move_left", "move_right")

	var final_x = clamp(keyboard_x + joystick_vector.x, -1, 1)

	if final_x != 0:
		velocity.x = final_x * SPEED
		$AnimatedSprite2D.flip_h = velocity.x > 0
		$AnimatedSprite2D.play("walk")
	else:
		velocity.x = lerp(velocity.x, 0.0, delta * 15)
		$AnimatedSprite2D.stop()
	
	var jump_pressed = Input.is_action_just_pressed("ui_up") or (joystick_vector.y < -0.5)
	if jump_pressed and is_on_floor():
		velocity.y = -JUMP_FORCE
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	move_and_slide()

func bounce():
	velocity.y = -JUMP_FORCE

func jump_side(x):
	velocity.y = -JUMP_FORCE
	velocity.x = x

func set_joystick_vector(vector: Vector2):
	joystick_vector = vector
	
func protection():
	pass
