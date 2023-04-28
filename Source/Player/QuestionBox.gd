extends Node2D

var chosen_option: bool = false
var chosen_option2: bool = false
var chosen_option3: bool = false

func _ready():
	$VBoxContainer/VBoxContainer/Option1.grab_focus()
	pass # Replace with function body.

func _on_Option1_pressed():
	print("Answer 1 selected!")
	chosen_option = true
	pass # Replace with function body.


func _on_Option2_pressed():
	print("Answer 2 selected!")
	chosen_option2 = true
	pass # Replace with function body.


func _on_Option3_pressed():
	print("Answer 3 selected!")
	chosen_option3 = true
	pass # Replace with function body.
