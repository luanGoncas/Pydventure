extends Node2D

func _ready():
	
	# Scroll instructions settings
	$Pulley.instruction = $Player/Scroll/Label
	$Chests/Chest_Show_Potion_Right.instruction = $Player/Scroll/Label2
	pass

func _process(delta):
	
	# Potion collecting verifier
	if get_node("Potion").collected:
		get_node("Pulley").got_potion = true
		
	# Checks if the pulley was activated
	if $Pulley.activate_chests:
		
		# Animates the chests and the painting
		$Chests/Chest_Show_Potion_Right.right_chest = true
		$Chests/chest_closed.hide()
		$Chests/chest_closed2.hide()
		$Chests/chest_closed3.hide()
		$Paintings/Painting.hide()
		
		# Sets the chests interaction
		get_node("Chests/Chest_Show_Potion_Right2").got_potion = true
		get_node("Chests/Chest_Show_Potion_Wrong2").got_potion = true
	
	# Checks if the pulley was stopped
	if $Chests/Chest_Show_Potion_Right.stop_pulley:
		$Paintings/Painting_Spin.hide()
		$Pulley.animation_player.play("stop")
		get_node("Door").level_clear = true
		
		# Deactive the chests
		get_node("Chests/Chest_Show_Potion_Right").right_chest = false
		get_node("Chests/Chest_Show_Potion_Right2").got_potion = false
		get_node("Chests/Chest_Show_Potion_Wrong2").got_potion = false
		if !get_node("Chests/Chest_Show_Potion_Right2").showed_potion:
			$Chests/chest_closed.show()
		if !get_node("Chests/Chest_Show_Potion_Wrong2").showed_potion:
			$Chests/chest_closed3.show()
	
	if get_node("Door").door_open:
		SceneChanger.change_scene("res://Source/Cutscenes/Chapter10/SupremeTest.tscn")
	
	pass
