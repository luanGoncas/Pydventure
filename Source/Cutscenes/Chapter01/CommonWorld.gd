extends Node

func _ready():
	PlayerData.score = 0
	$VBoxContainer/VBoxContainer/Next.grab_focus()

func _on_Next_pressed():
	print("YEAH! TEST!!!")
	SceneChanger.change_scene("res://Source/Cutscenes/Chapter02/CallToAdventure.tscn")
