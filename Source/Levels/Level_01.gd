extends Node2D

func _ready():
	
	# Sets the instruction to be displayed when interacting with the room painting
	$Painting.instruction = $Player/Scroll/Label
	pass

func _process(delta):
	if get_node("Ink_Vase").collected:
		$Painting.collected = true
	
	if get_node("Painting").next_room:
		get_node("Door").level_clear = true
		
	if get_node("Door").door_open:
		SceneChanger.change_scene("res://Source/Cutscenes/Chapter05/WhaleBelly.tscn")
