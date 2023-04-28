extends AnimatedSprite

var next_animation: bool = false # Allows the next animations
var got_blue: bool = false # Blue potion verifier
var is_player_inside: bool = false # Player area verifier
var instruction: Label # Label that will write code at the scroll
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_balance_if_else_diamond_if = 100 # Object default score value
var interactable: bool = false # Interaction verifier

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_blue:
		animation_player.play("if")
		
		# If the player didn't interact with it, his score will raise at the first interaction
		if !interactable:
			PlayerData.score += score_balance_if_else_diamond_if
			interactable = true
		instruction.show() # Writes code at the scroll

# Player area verifier method
func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass

# Player area verifier method
func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass

# Allows the next animations after animation finished
func _on_AnimationPlayer_animation_finished(anim_name):
	next_animation = true
	pass
