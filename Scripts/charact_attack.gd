class_name CharacterAttack extends Area2D

@onready var timer: Timer = $Timer
@onready var cooldown_timer: Timer = $CooldownTimer  

var can_attack: bool = true  

func _ready() -> void:
	hide()
	monitoring = false
	monitorable = false

func _process(_delta: float) -> void:
	if $"../AnimatedSprite2D".flip_h:
		$AnimatedSprite2D.position.x = -8
		$AnimatedSprite2D.flip_h = false
		position.x = 26
	else:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.position.x = 17
		position.x = -39

	if Input.is_action_just_pressed('attack') and can_attack:
		attack()

func attack():
	can_attack = false  
	show()
	monitoring = true
	monitorable = true
	$AttackAudio.play()
	timer.start()
	cooldown_timer.start() 

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.queue_free()
	

func _on_timer_timeout() -> void:
	hide()
	monitoring = false
	monitorable = false

func _on_cooldown_timer_timeout() -> void:
	can_attack = true
	
