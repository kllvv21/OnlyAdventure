extends Sprite2D

@onready var parent = $".."  
@onready var player = get_node_or_null("/root/MainMenu/Player") as Player

var is_pressed = false
var touch_index = -1  

@export var MaxLen = 45
@export var DeadZone = 5

func _ready() -> void:
	MaxLen *= parent.scale.x 

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed and global_position.distance_to(event.position) <= MaxLen:
			is_pressed = true
			touch_index = event.index  
		elif event.index == touch_index and not event.pressed:
			is_pressed = false
			touch_index = -1
			global_position = lerp(global_position, parent.global_position, 0.2)
			player.set_joystick_vector(Vector2.ZERO)
	
	elif event is InputEventScreenDrag and is_pressed and event.index == touch_index:
		var new_pos = event.position
		var direction = (new_pos - parent.global_position).normalized()
		var distance = min(new_pos.distance_to(parent.global_position), MaxLen)
		
		global_position = parent.global_position + direction * distance
		player.set_joystick_vector((global_position - parent.global_position) / MaxLen)

func _process(delta: float) -> void:
	if not is_pressed:
		global_position = lerp(global_position, parent.global_position, delta * 8)
