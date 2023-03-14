extends AnimatedSprite

var is_player_inside: bool = false # Player area verifier
var right_chest: bool = false # Right chest verifier
var stop_pulley: bool = false # Stopping pulley command
var instruction: Label # Label that will write code at the player scroll
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_right_chest = 100 # Object default score value
var interacted: bool = false # Interaction verifier

func _ready():
	animation_player.play("idle")
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and right_chest and is_player_inside:
		animation_player.play("show_potion")
		stop_pulley = true
		
		# If the player didn't interact with it, his score will raise at the first interaction
		if !interacted:
			PlayerData.score += score_right_chest
			interacted = true
		instruction.show()  # Writes code at the scroll

# Player area verifier method
func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass

# Player area verifier method
func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass
