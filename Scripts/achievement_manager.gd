extends Node

signal achievement_unlocked(id: String)

var achievements = {
	"first_death": false,
	"moneybag": false,
	"bloody_murderer": false,
	"no_time_to_waste": false,
	"greate_treasures": false,
	"true_legend": false
}

func _ready():
	load_achievements()

func unlock(id: String) -> void:
	if achievements.has(id) and not achievements[id]:
		achievements[id] = true
		achievement_unlocked.emit(id)
		save_achievements()

func save_achievements() -> void:
	var config = ConfigFile.new()
	for id in achievements:
		config.set_value("achievements", id, achievements[id])
	config.save("user://achievements.cfg")

func load_achievements() -> void:
	var config = ConfigFile.new()
	var err = config.load("user://achievements.cfg")
	if err == OK:
		for id in achievements:
			achievements[id] = config.get_value("achievements", id, false)


func reset_achievements():
	achievements = {
	"first_death": false,
	"moneybag": false,
	"bloody_murderer": false,
	"no_time_to_waste": false,
	"greate_treasures": false,
	"true_legend": false
	}
	save_achievements()
	
