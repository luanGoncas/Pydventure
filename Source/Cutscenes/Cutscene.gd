extends Node

func _ready():
	$VBoxContainer/VBoxContainer/Next.grab_focus()

func _on_Next_pressed():
	print("YEAH! I DIED!!!")
