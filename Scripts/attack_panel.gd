extends Panel

@onready var joystick = get_node_or_null("/root/MainMenu/GameControl/CanvasLayer/Joystick/Knob")
var valid_attack_touches = {}

func get_attack_area() -> CharacterAttack:
	var player = get_node_or_null("/root/MainMenu/Player")
	if player and is_instance_valid(player):
		return player.get_node_or_null("AttackArea") as CharacterAttack
	return null

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			if joystick and not joystick.is_touch_in_joystick_area(event.position):
				valid_attack_touches[event.index] = event.position
				try_attack()
		else:
			valid_attack_touches.erase(event.index)

func try_attack() -> void:
	var attack_area = get_attack_area()
	if attack_area and attack_area.can_attack:
		attack_area.attack()
