extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Balances/Balance_If_Else_Diamond_If.instruction = $Player/Scroll/Label
	$Balances/Balance_If_Else_Diamond_Else.instruction = $Player/Scroll/Label2
	$Balances/Balance_If_Else_Diamond_Else.instruction2 = $Player/Scroll/Label3
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("Potions/Potion").collected:
		$Balances/Balance_If_Else_Diamond_If.got_blue = true
		$Balances/Balance_If_Else_Diamond_Else.got_blue = true
	if get_node("Potions/Potion2").collected:
		$Balances/Balance_If_Else_Diamond_Else.got_green = true
	if get_node("Balances/Balance_If_Else_Diamond_If").next_animation:
		$Chests/Chest_Show_Potion.opened_chests = true
		$Balances/Balance_If_Else_Diamond_Else.previous_animation = true
	if get_node("Balances/Balance_If_Else_Diamond_Else").next_animation:
		$Chests/Chest_Show_Potion_Invert.opened_chests = true
	pass
