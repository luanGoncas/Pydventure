extends Node2D

func _ready():
	
	# Scroll instructions settings
	$Balances/Balance_If_Else_Diamond_If.instruction = $Player/Scroll/Label
	$Balances/Balance_If_Else_Diamond_Else.instruction = $Player/Scroll/Label2
	$Balances/Balance_If_Else_Diamond_Else.instruction2 = $Player/Scroll/Label3
	
	pass

func _process(delta):
	
	# Potions collecting verifiers
	if get_node("Potions/Potion").collected:
		$Balances/Balance_If_Else_Diamond_If.got_blue = true
		$Balances/Balance_If_Else_Diamond_Else.got_blue = true
	if get_node("Potions/Potion2").collected:
		$Balances/Balance_If_Else_Diamond_Else.got_green = true
	
	# Checking permissions for balance animations sequence
	if get_node("Balances/Balance_If_Else_Diamond_If").next_animation:
		$Chests/Chest_Show_Potion.opened_chests = true
		$Balances/Balance_If_Else_Diamond_Else.previous_animation = true
	if get_node("Balances/Balance_If_Else_Diamond_Else").next_animation:
		$Chests/Chest_Show_Potion_Invert.opened_chests = true
	pass
