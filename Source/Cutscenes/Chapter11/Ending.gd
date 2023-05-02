extends Node

func _ready():
	$VBoxContainer/VBoxContainer/Next.grab_focus()

func _on_Next_pressed():
	if PlayerData.score <= 600:
		 SceneChanger.change_scene("res://Source/Cutscenes/Chapter12/RankingJunior.tscn")
	elif PlayerData.score <= 800:
		SceneChanger.change_scene("res://Source/Cutscenes/Chapter12/RankingPleno.tscn")
	else:
		SceneChanger.change_scene("res://Source/Cutscenes/Chapter12/RankingSenior.tscn")
