extends AnimatedSprite

var got_potion: bool = false # Potion verifier
var is_player_inside: bool = false # Player verifier
var activate_chests: bool = false # Permission to activate pulley verifier
var instruction: Label # Label that will write the code at the scroll
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_pulley = 50 # Object default score value
var interacted: bool = false # Interaction verifier

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_potion:
		
		# Starts the pulley movement
		animation_player.play("spin")
		activate_chests = true
		
		# If the player didn't interact with it, his score will raise at the first interaction
		if !interacted:
			PlayerData.score += score_pulley
			interacted = true
		instruction.show() # Writes code at the scroll

# Player area verifier method
func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass

# Player area verifier method
func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass
