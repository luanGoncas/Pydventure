extends AnimatedSprite

var is_player_inside: bool = false # Player area verifier
var collected: bool = false # Ink vase collecting verifier
var instruction: Label # Label that writes code at the scroll
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
onready var animated_sprite: AnimatedSprite = get_node(".") # Object animations
export var score_painting: = 50 # Object default score value
var interacted: bool = false # Interaction verifier

func _ready():
	animation_player.play("idle")
	pass

func _input(event: InputEvent):
	
	# Verify if the player has reached the painting and interacted with it
	if event.is_action_pressed("interact") and is_player_inside:
		if collected:
			animation_player.play("print")
			
			# If the player didn't interact with it, his score will raise at the first interaction
			if (!interacted):
				PlayerData.score += score_painting
				interacted = true
			instruction.show() # Writes code at the scroll
			
# Score debug only
func _process(delta):
	print(PlayerData.score)

# Player area verifier method
func _on_Area2D_body_entered(_player: KinematicBody2D):
	is_player_inside = true
	pass # Replace with function body.

# Player area verifier method
func _on_Area2D_body_exited(_player: KinematicBody2D):
	is_player_inside = false
	pass # Replace with function body.

func _on_AnimationPlayer_animation_finished(anim_name):
	pass # Replace with function body.
