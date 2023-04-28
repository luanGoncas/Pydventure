extends AnimatedSprite

var previous_animation: bool = false # Confirms that the previous object was animated
var next_animation: bool = false # Allows the next animations
var got_blue: bool = false # Blue potion verifier
var got_green: bool = false # Red potion verifier
var is_player_inside: bool = false # Player area verifier

# Labels that will write code at the scroll
var instruction: Label
var instruction2: Label

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_balance_if_else_diamond_else = 100 # Object default score value
var interactable: bool = false # Interaction verifier

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_blue and got_green and previous_animation:
		animation_player.play("else")
		
		# If the player didn't interact with it, his score will raise at the first interaction
		if !interactable:
			PlayerData.score += score_balance_if_else_diamond_else
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

# Allows next object animation and writes code at the scroll
func _on_AnimationPlayer_animation_finished(anim_name):
	instruction2.show()
	next_animation = true
	pass
