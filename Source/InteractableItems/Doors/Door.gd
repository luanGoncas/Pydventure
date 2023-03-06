extends Area2D
export(String, FILE, "*tscn,*scn") var target_room

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		if !target_room:
			print("No room in this door")
			return
		if get_overlapping_bodies().size() > 0:
			next_room()

func next_room():
	var ERR = get_tree().change_scene(target_room)
	
	if ERR != OK:
		print("Something failed in the door room")
	
	Global.door_name = name
