extends Node

func _ready():
	$VBoxContainer/VBoxContainer/Next.grab_focus()
	pass # Replace with function body.

func _on_Next_pressed():
	SceneChanger.change_scene("res://Source/Options.tscn")
	pass # Replace with function body.
