extends AnimatedSprite

var got_green: bool = false # Green potion verifier
var is_player_inside: bool = false # Player area verifier
var painting: Sprite # Sprite for blank painting
var painting_true: Sprite # Sprite for written painting
var instruction: Label # Label that will write code at the scroll
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_balance_minor = 50 # Object default score value
var interacted: bool = false # Interaction verifier
var finished: bool = false # Interaction finished verifier

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_green:
		animation_player.play("minor")
		
		# If the player didn't interact with it, his score will raise at the first interaction
		if (!interacted):
			PlayerData.score += score_balance_minor
			interacted = true
		instruction.show() # Writes code at the scroll

# Sets the paintings at the level after animation finished
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	painting.hide()
	painting_true.show()
	finished = true
	pass # Replace with function body.

# Player area verifier method
func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass

# Player area verifier method
func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass
