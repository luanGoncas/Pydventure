extends Node2D

var total_operations: int = 0

# Sets the code that will be written by the painting interactions
func _ready():
	$Paintings/Painting_Sum.instruction = $Player/Scroll/Label
	$Paintings/Painting_Sub.instruction = $Player/Scroll/Label2
	$Paintings/Painting_Mult.instruction = $Player/Scroll/Label3
	$Paintings/Painting_Div.instruction = $Player/Scroll/Label4

func _process(delta):
	
	# Potions verifier
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
	
	# Paintings verifier
	if $Cauldrons/Cauldron.got_potion:
		$Paintings/Painting_Sum.collected = true
	
	if $Cauldrons/Cauldron2.got_potion:
		$Paintings/Painting_Sub.collected = true
	
	if $Cauldrons/Cauldron3.got_potion:
		$Paintings/Painting_Mult.collected = true
	
	if $Cauldrons/Cauldron4.got_potion:
		$Paintings/Painting_Div.collected = true
	
	if get_node("Paintings/Painting_Sum").interacted and get_node("Paintings/Painting_Sub").interacted and get_node("Paintings/Painting_Mult").interacted and get_node("Paintings/Painting_Div").interacted:
		get_node("Door").level_clear = true
	
	if get_node("Door").door_open:
		SceneChanger.change_scene("res://Source/Cutscenes/Chapter06/HiddenCave01.tscn")
