extends AnimatedSprite

var next_animation: bool = false # Enables the following animated items at the level
var got_blue: bool = false # Blue potion verifier
var is_player_inside: bool = false # Player area verifier

# Both labels will write code at the scroll
var instruction: Label 
var instruction2: Label

var painting_bigger: Sprite # Sprite for blank painting
var painting: Sprite # Sprite for written painting
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_blue:
		animation_player.play("action")
		instruction.show()

# Player area verifier method
func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.

# Player area verifier method
func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.

# Sets the paintings at the level after animation finished
func _on_AnimationPlayer_animation_finished(anim_name):
	instruction2.show()
	painting.hide()
	painting_bigger.show()
	next_animation = true
	pass # Replace with function body.
