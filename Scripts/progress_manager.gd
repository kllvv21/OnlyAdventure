extends Node


const SAVE_PATH = "user://game_save.dat"  

var game_data = {
	"current_level": 1,
	"coins": 0,
	"deaths": 0,
	"kills": 0,
	"unlocked_skins": ["default"],
	"selected_skin": "default"
}

func _ready():
	load_game()

func save_data():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		return
	file.store_var(game_data)
	file.close()

func load_game():
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return
	var loaded_data = file.get_var()
	file.close()
	if loaded_data == null:
		return
	if not loaded_data is Dictionary:
		return
	game_data = loaded_data
	print(game_data)

func reset_progress():
	game_data = {
	"current_level": 1,
	"coins": 0,
	"deaths": 0,
	"kills": 0,
	"unlocked_skins": ["default"],
	"selected_skin": "default" 
	}
	save_data()


func get_coins() -> int:
	return game_data.get("coins", 0)
	
func add_coins(amount: int):
	game_data["coins"] += amount
	save_data()

func add_kill():
	game_data['kills'] += 1
	save_data()

func get_level():
	return game_data.get("current_level", 1)
	
func set_level():
	game_data["current_level"] += 1
	save_data()

func increase_death():
	game_data["deaths"] += 1
	save_data()
	
func get_deaths():
	return game_data.get("deaths", 0)
