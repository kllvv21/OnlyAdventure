class_name EnemyMove extends Node

@export var SPEED = 260.0
@export var GRAVITY = 900
@export var JUMP_FORCE = 300
@export var walking_distance = 120

@onready var fol = $"../FollowTheCharacter"
@onready var parent: CharacterBody2D = get_parent()
@onready var start_pos = parent.position

var direction = 1


func _physics_process(_delta: float) -> void:
	$"../AnimatedSprite2D".play('run')
	if not fol.is_follow:
		if not parent.is_on_floor():
			parent.velocity.y += GRAVITY
		walking()
		parent.move_and_slide()

func walking():
	if abs(parent.position.x - start_pos.x) >= walking_distance:
		direction *= -1
	$"../AnimatedSprite2D".flip_h = direction > 0
	parent.velocity.x = direction * SPEED
	if parent.is_on_wall():
		parent.velocity.y = -JUMP_FORCE
