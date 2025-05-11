class_name CharacterAttack extends Area2D

@onready var timer
@onready var cooldown_timer

var can_attack: bool = true  

func _ready() -> void:
	hide()
	monitoring = false
	monitorable = false
	timer = Timer.new()
	cooldown_timer = Timer.new()
	add_child(timer)
	add_child(cooldown_timer)
	timer.timeout.connect(_on_timer_timeout)
	cooldown_timer.timeout.connect(_on_cooldown_timer_timeout)


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
	timer.start(1.0)
	cooldown_timer.start(1.5) 

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.queue_free()
		ProgressManager.add_kill()
		if ProgressManager.get_kill() >= 10:
			AchievementManager.unlock("bloody_murderer")


func _on_timer_timeout() -> void:
	hide()
	monitoring = false
	monitorable = false

func _on_cooldown_timer_timeout() -> void:
	can_attack = true
	
	
	
