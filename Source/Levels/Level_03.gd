extends Node2D

func _ready():
	
	# Sets the scroll instructions according the level items
	$Chests/Chest_A.instruction = $Player/Scroll/Label
	$Chests/Chest_B.instruction = $Player/Scroll/Label2
	$Chests/Chest_B.instruction2 = $Player/Scroll/Label3
	pass

func _process(delta):
	
	# Chest potions verifiers
	if get_node("Potion").collected:
		$Chests/Chest_A.got_potion = true
		
	if get_node("Chests/Chest_A").opened_A:
		$Chests/Chest_B.opened_A = true
		
	if get_node("Chests/Chest_B").next_room:
		get_node("Door").level_clear = true
	
	if get_node("Door").door_open:
		SceneChanger.change_scene("res://Source/Cutscenes/Chapter07/HiddenCave02.tscn")
	pass
