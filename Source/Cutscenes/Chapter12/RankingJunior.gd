extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/VBoxContainer/Next.grab_focus()
	pass # Replace with function body.

func _on_Next_pressed():
	SceneChanger.change_scene("res://Source/MainMenu.tscn")
	pass # Replace with function body.


func _on_Next2_pressed():
	get_tree().quit()
	pass # Replace with function body.
