class_name FollowTheCharacter extends Node

@export var SPEED = 60.0
@export var GRAVITY = 900
@export var JUMP_FORCE = 300
@export var follow_distance = 400

@onready var parent: CharacterBody2D = get_parent()
@onready var start_pos = parent.position

var is_follow = false
var overshoot_lim = 2
var target: Player

func update_velocity():
	if !target:
		var dir_to_start = Vector2(start_pos.x - parent.global_position.x, 0)
		$"../AnimatedSprite2D".flip_h = dir_to_start.x > 0
		if dir_to_start.length() < overshoot_lim:
			parent.global_position.x = start_pos.x
			is_follow = false
			return
		var start_velocity = dir_to_start.normalized() * SPEED
		parent.velocity.x = start_velocity.x
		if parent.is_on_wall():
			parent.velocity.y = -JUMP_FORCE
		return
	var distance = abs(start_pos.x - parent.global_position.x)
	if distance > follow_distance:
		target = null
		return
	var direction = Vector2(target.global_position.x - parent.global_position.x, 0).normalized()
	$"../AnimatedSprite2D".flip_h = direction.x > 0
	var new_velocity = direction * SPEED
	if parent.is_on_wall() and is_colliding_with_wall():
		parent.velocity.y = -JUMP_FORCE
	parent.velocity.x = new_velocity.x
	
func _physics_process(delta: float) -> void:
	if is_follow:
		if not parent.is_on_floor():
			parent.velocity.y += GRAVITY * delta
		update_velocity()
		parent.move_and_slide()
	
func is_colliding_with_wall() -> bool:
	for i in range(parent.get_slide_collision_count()):
		var collision = parent.get_slide_collision(i)
		var collider = collision.get_collider()
		return not(collider is CharacterBody2D)  
	return false
	
func _on_follow_area_body_entered(body: Node2D) -> void:
	if body is Player:
		target = body
		is_follow = true
