class_name Player extends CharacterBody2D

@export var SPEED = 260.0
@export var GRAVITY = 900
@export var JUMP_FORCE = 370

var joystick_vector = Vector2.ZERO  

var is_on_ice = false
var is_on_ladder = false
var is_protected = false

func _physics_process(delta: float) -> void:
	var keyboard_x = Input.get_axis("move_left", "move_right")
	var final_x = clamp(keyboard_x + joystick_vector.x, -1, 1)

	if final_x != 0:
		velocity.x = final_x * SPEED
		$AnimatedSprite2D.flip_h = velocity.x > 0
		$AnimatedSprite2D.play("walk")
	elif is_on_ice:
		velocity.x = lerp(velocity.x, 0.0, delta * 0.8)
		$AnimatedSprite2D.stop()
	else:
		velocity.x = lerp(velocity.x, 0.0, delta * 19)
		$AnimatedSprite2D.stop()

	if is_on_ladder:
		var vertical_input = Input.get_axis("ui_up", "ui_down") + joystick_vector.y
		velocity.y = clamp(vertical_input, -1, 1) * SPEED * 0.7
	else:
		var jump_pressed = Input.is_action_just_pressed("ui_up") or (joystick_vector.y < -0.5)
		if jump_pressed and is_on_floor():
			velocity.y = -JUMP_FORCE
		elif not is_on_floor():
			velocity.y += GRAVITY * delta

	move_and_slide()

func bounce():
	velocity.y = -JUMP_FORCE

func jump_side(x):
	velocity.y = -JUMP_FORCE
	velocity.x = x

func set_joystick_vector(vector: Vector2):
	joystick_vector = vector
	
func set_protection():
	is_protected = true

func delete_protection():
	is_protected = false
