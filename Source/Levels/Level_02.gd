extends Node2D

func _ready():
	$Paintings/Painting_Sum.instruction = $Player/Scroll/Label
	$Paintings/Painting_Sub.instruction = $Player/Scroll/Label2
	$Paintings/Painting_Mult.instruction = $Player/Scroll/Label3
	$Paintings/Painting_Div.instruction = $Player/Scroll/Label4

func _process(delta):
	if get_node("Potions/Potion").collected:
		$Cauldrons/Cauldron.got_red = true
	
	if get_node("Potions/Potion2").collected:
		$Cauldrons/Cauldron.got_blue = true
	
	if get_node("Potions/Potion3").collected:
		$Cauldrons/Cauldron2.got_red = true
	
	if get_node("Potions/Potion4").collected:
		$Cauldrons/Cauldron2.got_blue = true
	
	if get_node("Potions/Potion5").collected:
		$Cauldrons/Cauldron4.got_red = true
	
	if get_node("Potions/Potion6").collected:
		$Cauldrons/Cauldron4.got_blue = true
	
	if get_node("Potions/Potion7").collected:
		$Cauldrons/Cauldron3.got_blue = true
	
	if get_node("Potions/Potion8").collected:
		$Cauldrons/Cauldron3.got_red = true
	
	if $Cauldrons/Cauldron.got_potion:
		$Paintings/Painting_Sum.collected = true
	
	if $Cauldrons/Cauldron2.got_potion:
		$Paintings/Painting_Sub.collected = true
	
	if $Cauldrons/Cauldron3.got_potion:
		$Paintings/Painting_Mult.collected = true
	
	if $Cauldrons/Cauldron4.got_potion:
		$Paintings/Painting_Div.collected = true
