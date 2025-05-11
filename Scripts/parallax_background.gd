extends ParallaxBackground

@onready var speed: int = 40

func _process(delta: float) -> void:
	scroll_offset.x -= speed * delta



	
