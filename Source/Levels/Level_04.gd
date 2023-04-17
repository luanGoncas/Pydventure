extends Node2D

func _ready():
	
	# Scroll instructions settings
	$Balances/Balance_Minor.instruction = $Player/Scroll/Label
	$Balances/Balance_If_Else_Invert.instruction = $Player/Scroll/Label2
	$Balances/Balance_Equals.instruction = $Player/Scroll/Label3
	
	# Paintings verifiers
	$Balances/Balance_Minor.painting = $Paintings/Painting
	$Balances/Balance_Minor.painting_true = $Paintings/Painting_True
	$Balances/Balance_If_Else_Invert.painting2 = $Paintings/Painting2
	$Balances/Balance_If_Else_Invert.painting_false = $Paintings/Painting_False
	$Balances/Balance_Equals.painting3 = $Paintings/Painting3
	$Balances/Balance_Equals.painting_true2 = $Paintings/Painting_True2
	pass
	
func _process(delta):
	
	# Potions verifiers
	if get_node("Potions/Potion").collected:
		$Balances/Balance_Minor.got_green = true
	if get_node("Potions/Potion2").collected:
		$Balances/Balance_If_Else_Invert.got_blue = true
	if get_node("Potions/Potion3").collected:
		$Balances/Balance_Equals.got_red = true
	
	if get_node("Balances/Balance_Equals").finished and get_node("Balances/Balance_If_Else_Invert").finished and get_node("Balances/Balance_Minor").finished:
		get_node("Door").level_clear = true
	
	if get_node("Door").door_open:
		SceneChanger.change_scene("res://Source/Cutscenes/Chapter08/HiddenCave03.tscn")
