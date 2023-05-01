extends Node2D

export var score_quiz: int = 25 # Answer correct default score value

# Question interaction verifiers
var interactable_question_01: bool = false
var interactable_question_02: bool = false
var interactable_question_03: bool = false
var interactable_question_04: bool = false
var interactable_question_05: bool = false

var wrong_answer: bool = false

func _ready():
	
	# Scroll instructions verifiers
	$Elevator.instruction = $Player/Scroll/Label
	$Elevator.instruction2 = $Player/Scroll/Label2
	$Elevator.instruction3 = $Player/Scroll/Label3
	
	pass

func _process(delta):
		
	# Checks if the player is inside the elevator
	if get_node("Elevator").player_entered:
		$Player.motion.y = $Elevator.move.y # Syncronizes player and elevator movements
		if (wrong_answer):
			SceneChanger.change_scene("res://Source/Levels/Level_07.tscn")
		else:
			question_change(get_node("Elevator").level_at) # Question changer according the elevator height
	
	if get_node("Córdex_2").dead:
		get_node("Córdex_2/AnimatedSprite").hide()
		get_node("Córdex_2/CollisionShape2D").disabled = true
	
# Questions method
func question_change(level):
	match level:
		0:
			if not $Player/QuestionBoxes/QuestionBox.visible:
				$Player/QuestionBoxes/QuestionBox/VBoxContainer/VBoxContainer/Option1.grab_focus()
				$Player/QuestionBoxes/QuestionBox.show()
			if $Player/QuestionBoxes/QuestionBox.chosen_option:
				wrong_answer = false
				get_node("Elevator").right_answer = true
				$Player/QuestionBoxes/QuestionBox.hide()
				if !interactable_question_01 and !SceneChanger.interactable_question_01:
					PlayerData.score += score_quiz
					interactable_question_01 = true
					SceneChanger.interactable_question_01 = true
			if $Player/QuestionBoxes/QuestionBox.chosen_option2 or $Player/QuestionBoxes/QuestionBox.chosen_option3:
				PlayerData.score -= score_quiz
				wrong_answer = true
		1:
			if not $Player/QuestionBoxes/QuestionBox2.visible:
				$Player/QuestionBoxes/QuestionBox2/VBoxContainer/VBoxContainer/Option1.grab_focus()
				$Player/QuestionBoxes/QuestionBox2.show()
			if $Player/QuestionBoxes/QuestionBox2.chosen_option2:
				wrong_answer = false
				get_node("Elevator").right_answer = true
				$Player/QuestionBoxes/QuestionBox2.hide()
				if !interactable_question_02 and !SceneChanger.interactable_question_02:
					PlayerData.score += score_quiz
					interactable_question_02 = true
					SceneChanger.interactable_question_02 = true
			if $Player/QuestionBoxes/QuestionBox2.chosen_option or $Player/QuestionBoxes/QuestionBox2.chosen_option3:
				PlayerData.score -= score_quiz
				wrong_answer = true
		2:
			if not $Player/QuestionBoxes/QuestionBox3.visible:
				$Player/QuestionBoxes/QuestionBox3/VBoxContainer/VBoxContainer/Option1.grab_focus()
				$Player/QuestionBoxes/QuestionBox3.show()
			if $Player/QuestionBoxes/QuestionBox3.chosen_option3:
				wrong_answer = false
				get_node("Elevator").right_answer = true
				$Player/QuestionBoxes/QuestionBox3.hide()
				if !interactable_question_03 and !SceneChanger.interactable_question_03:
					PlayerData.score += score_quiz
					interactable_question_03 = true
					SceneChanger.interactable_question_03 = true
			if $Player/QuestionBoxes/QuestionBox3.chosen_option or $Player/QuestionBoxes/QuestionBox3.chosen_option2:
				PlayerData.score -= score_quiz
				wrong_answer = true
		3:
			if not $Player/QuestionBoxes/QuestionBox4.visible:
				$Player/QuestionBoxes/QuestionBox4/VBoxContainer/VBoxContainer/Option1.grab_focus()
				$Player/QuestionBoxes/QuestionBox4.show()
			if $Player/QuestionBoxes/QuestionBox4.chosen_option:
				get_node("Elevator").right_answer = true
				wrong_answer = false
				$Player/QuestionBoxes/QuestionBox4.hide()
				if !interactable_question_04 and !SceneChanger.interactable_question_04:
					PlayerData.score += score_quiz
					interactable_question_04 = true
					SceneChanger.interactable_question_04 = true
			if $Player/QuestionBoxes/QuestionBox4.chosen_option2 or $Player/QuestionBoxes/QuestionBox4.chosen_option3:
				PlayerData.score -= score_quiz
				wrong_answer = true
		4:
			if not $Player/QuestionBoxes/QuestionBox5.visible:
				$Player/QuestionBoxes/QuestionBox5/VBoxContainer/VBoxContainer/Option1.grab_focus()
				$Player/QuestionBoxes/QuestionBox5.show()
			if $Player/QuestionBoxes/QuestionBox5.chosen_option:
				get_node("Elevator").right_answer = true
				wrong_answer = false
				$Player/QuestionBoxes/QuestionBox5.hide()
				if !interactable_question_05 and !SceneChanger.interactable_question_05:
					PlayerData.score += score_quiz
					interactable_question_05 = true
					SceneChanger.interactable_question_05 = true
			if $Player/QuestionBoxes/QuestionBox5.chosen_option2 or $Player/QuestionBoxes/QuestionBox5.chosen_option3:
				PlayerData.score -= score_quiz
				wrong_answer = true
