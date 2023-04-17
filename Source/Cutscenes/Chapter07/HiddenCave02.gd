extends Node

func _ready():
	$VBoxContainer/VBoxContainer/Next.grab_focus()

func _on_Next_pressed():
	print("YEAH! TEST!!!")
	SceneChanger.change_scene("res://Source/Levels/Level_04.tscn")
