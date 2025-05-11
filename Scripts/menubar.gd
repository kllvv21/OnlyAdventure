extends Control

var characters = { "Chill Girlie":
	{"description": "A calm and clever girl. 
	Quick-witted and dependable, 
	she keeps a cool head 
	in any situation.", 
	"cost": 0,
	"unlocked": true,
	"picture": preload("res://Sprites/Chill_Girlie_avatar.png")},
	
	"Disco Boy":
	{"description": "A confident guy with
	sharp instincts. His 
	rhythm keeps the enemies
	off balance.", 
	"cost": 0,
	"unlocked": true,
	"picture": preload("res://Sprites/Disco_boy_avatar.png")},
	
	"Sugar Girl":
	{"description": "Sweet and stylish,
	but don’t be fooled—she’s bold 
	and full of surprises. Her charm 
	is as strong as her will.", 
	"cost": 100,
	"unlocked": false,
	"picture": preload("res://Sprites/Sugar_girl_avatar.png")}
}
var current_character_index = 0
var character_names = []

	
func _ready() -> void:
	character_names = characters.keys()
	var current_scene_name = get_tree().current_scene.name
	if current_scene_name == "Store":
		update_character_display()
	
func update_character_display():
	var current_name = character_names[current_character_index]
	var character = characters[current_name]
	character["unlocked"] = ProgressManager.is_skin_unlocked(current_name)
	$CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/Name.text = current_name
	$CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/Description.text = character["description"]
	$CanvasLayer/VBoxContainer/HBoxContainer/TextureRect.texture = character['picture']
	if !character['unlocked']:
		$CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/Cost.text = "Cost: " + str(character["cost"])
		$CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/Cost.show()
		$CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/Select.text = "Buy"
	else: 
		$CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/Cost.hide()
		$CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/Select.text = "Selected" if ProgressManager.get_skin() == current_name else "Select" 
	
		

func _on_menu_button_pressed() -> void:
	$AudioClick.play()
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")


func _on_ach_button_pressed() -> void:
	$AudioClick.play()
	get_tree().change_scene_to_file("res://Scenes/achivements.tscn")


func _on_store_button_pressed() -> void:
	$AudioClick.play()
	get_tree().change_scene_to_file("res://Scenes/store.tscn")


func _on_level_button_pressed() -> void:
	$AudioClick.play()
	get_tree().change_scene_to_file("res://Scenes/levels_scene.tscn")


func _on_button_2_pressed() -> void:
	$AudioClick.play()
	current_character_index = wrapi(current_character_index - 1, 0, character_names.size())
	update_character_display()


func _on_button_pressed() -> void:
	$AudioClick.play()
	current_character_index = wrapi(current_character_index + 1, 0, character_names.size())
	update_character_display()


func _on_select_pressed() -> void:
	var current_name = character_names[current_character_index]
	var character = characters[current_name]
	if character['unlocked'] and ProgressManager.get_skin() != current_name:
		ProgressManager.set_skin(current_name)
	else:
		if !character['unlocked'] and ProgressManager.get_coins() >= character['cost']:
			ProgressManager.unlock_skin(current_name)
			ProgressManager.add_coins(-1 * character['cost'])
			character['unlocked'] = true
	update_character_display()
	$CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/Select.release_focus()
