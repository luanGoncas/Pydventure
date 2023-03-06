extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Pulley.instruction = $Player/Scroll/Label
	$Chests/Chest_Show_Potion_Right.instruction = $Player/Scroll/Label2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("Potion").collected:
		get_node("Pulley").got_potion = true
	if $Pulley.activate_chests:
		$Chests/Chest_Show_Potion_Right.right_chest = true
		$Chests/chest_closed.hide()
		$Chests/chest_closed2.hide()
		$Chests/chest_closed3.hide()
		$Paintings/Painting.hide()
		get_node("Chests/Chest_Show_Potion_Right2").got_potion = true
		get_node("Chests/Chest_Show_Potion_Wrong2").got_potion = true
	if $Chests/Chest_Show_Potion_Right.stop_pulley:
		$Paintings/Painting_Spin.hide()
		$Pulley.animation_player.play("stop")
		get_node("Chests/Chest_Show_Potion_Right").right_chest = false
		get_node("Chests/Chest_Show_Potion_Right2").got_potion = false
		get_node("Chests/Chest_Show_Potion_Wrong2").got_potion = false
		if !get_node("Chests/Chest_Show_Potion_Right2").showed_potion:
			$Chests/chest_closed.show()
		if !get_node("Chests/Chest_Show_Potion_Wrong2").showed_potion:
			$Chests/chest_closed3.show()
	pass
