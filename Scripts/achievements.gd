extends CanvasLayer

@onready var ui_map = {
	"first_death": $VBoxContainer2/VBoxContainer/HBoxContainer/VBoxContainer/Skull,
	"moneybag": $VBoxContainer2/VBoxContainer/HBoxContainer/VBoxContainer2/Coins,
	"bloody_murderer": $VBoxContainer2/VBoxContainer/HBoxContainer2/VBoxContainer/Sword,
	"no_time_to_waste": $VBoxContainer2/VBoxContainer/HBoxContainer/VBoxContainer3/Hourglass,
	"greate_treasures": $VBoxContainer2/VBoxContainer/HBoxContainer2/VBoxContainer2/Trunk,
	"true_legend": $VBoxContainer2/VBoxContainer/HBoxContainer2/VBoxContainer3/Goblet
}

var textures = {
	"first_death": preload("res://Sprites/Skull.png"),
	"moneybag": preload("res://Sprites/Coins.png"),
	"bloody_murderer": preload("res://Sprites/Sword.png"),
	"no_time_to_waste": preload("res://Sprites/hourglass.png"),
	"greate_treasures": preload("res://Sprites/Trunk_achivement.png"),
	"true_legend": preload("res://Sprites/Goblet.png")
}

func _ready() -> void:
	AchievementManager.achievement_unlocked.connect(_on_unlock)
	_load_unlocked()

func _on_unlock(id: String) -> void:
	if ui_map.has(id) and textures.has(id):
		ui_map[id].texture = textures[id]

func _load_unlocked() -> void:
	AchievementManager.load_achievements()
	for id in AchievementManager.achievements:
		if AchievementManager.achievements[id] and ui_map.has(id) and textures.has(id):
			ui_map[id].texture = textures[id]
