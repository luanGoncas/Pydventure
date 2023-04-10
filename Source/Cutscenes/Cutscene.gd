extends Node

func _ready():
	$VBoxContainer/VBoxContainer/Next.grab_focus()

func _on_Next_pressed():
	print("YEAH! I DIED!!!")
	SceneChanger.change_scene("res://Source/Levels/Level_01.tscn")
