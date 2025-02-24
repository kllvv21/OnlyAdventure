extends Area2D

signal hit

@export var speed: int = 100 # Скорость передвижения
@export var jump_power: int = 250 # Сила прыжка
@export var gravit: int = 800 # Гравитация

var velocity: Vector2 = Vector2.ZERO
var screen_size: Vector2
var is_jumping: bool = false

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	
	velocity.y += gravit * delta  # Применение гравитации

	# Горизонтальное движение
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
	else:
		velocity.x = 0

	# Прыжок
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -jump_power
		is_jumping = true

	# Обновление позиции
	position += velocity * delta

	# Остановка анимации при отсутствии движения
	if velocity.x != 0:
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.flip_h = velocity.x > 0
	else:
		$AnimatedSprite2D.stop()

	position = position.clamp(Vector2.ZERO, screen_size)

func is_on_floor() -> bool:
	return position.y >= screen_size.y  # 32 - условная высота пола

func _on_body_entered(body: Node2D) -> void:
	pass # Обработчик столкновений
