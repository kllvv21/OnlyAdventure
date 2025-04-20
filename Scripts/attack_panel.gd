extends Panel

@onready var attackArea = get_node_or_null("/root/MainMenu/Player/AttackArea") as CharacterAttack
@onready var joystick = get_node_or_null("/root/MainMenu/GameControl/CanvasLayer/Joystick/Knob")

var valid_attack_touches = {}

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		if joystick and not joystick.is_touch_in_joystick_area(event.position):
			valid_attack_touches[event.index] = event.position
			try_attack()

	elif event is InputEventScreenTouch and not event.pressed:
		valid_attack_touches.erase(event.index)

func try_attack() -> void:
	if attackArea.can_attack:
		attackArea.attack()
