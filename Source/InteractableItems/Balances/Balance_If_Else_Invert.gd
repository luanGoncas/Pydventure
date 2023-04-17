extends AnimatedSprite

var got_blue: bool = false # Blue potion verifier
var is_player_inside: bool = false # Player area verifier
var painting2: Sprite # Sprite for blank painting
var painting_false: Sprite # Sprite for written painting
var instruction: Label # Label that will write code at the scroll
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_balance_if_else_invert = 50 # Object default score value
var interacted: bool = false # Interaction verifier
var finished: bool = false # Interaction finished verifier

func _ready():
	animation_player.play("idle")
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_blue:
		animation_player.play("action_invert")
		
		# If the player didn't interact with it, his score will raise at the first interaction
		if (!interacted):
			PlayerData.score += score_balance_if_else_invert
			interacted = true
		instruction.show() # Writes code at the scroll

# Sets the paintings at the level after animation finished
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	painting2.hide()
	painting_false.show()
	finished = true
	pass

# Player area verifier method
func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass

# Player area verifier method
func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass
