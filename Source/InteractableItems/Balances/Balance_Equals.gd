extends AnimatedSprite

var got_red: bool = false # Boolean verifier for red potion
var is_player_inside: bool = false # Player area verifier
var painting3: Sprite # Sprite for blank painting
var painting_true2: Sprite # Sprite for written painting
var instruction: Label # Label for writting at the scroll
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_balance_equals = 50 # Object default score value
var interacted: bool = false # Interaction verifier
var finished: bool = false # Interaction finished verifier

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_red:
		animation_player.play("equals")
		
		# If the player didn't interact with it, his score will raise at the first interaction
		if (!interacted):
			PlayerData.score += score_balance_equals
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

# Method that shows the instruction at the painting
func _on_AnimationPlayer_animation_finished(anim_name):
	painting3.hide()
	painting_true2.show()
	finished = true
	pass
