extends AnimatedSprite

var is_player_inside: bool = false # Player area verifier
var is_opened: bool = false # Chest open verifier

# Labels that will write the code at player scroll
var instruction: Label 
var instruction2: Label

var next_room: bool = false # Next stage confirmer
var got_potion: bool = false # Potion verifier
var opened_A: bool = false # Chest open verifier
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_chest_B = 25 # Object default score value
var interacted: bool = false # Interaction verifier

func _ready():
	animation_player.play("idle")
	pass

func _input(event: InputEvent):
	
	# Checks if the player interacted with chest, got the level potion, and the first chest was open
	if event.is_action_pressed("interact") and is_player_inside and opened_A:
		is_opened = true
		animation_player.play("show_potion")
		
		# If the player didn't interact with it, his score will raise at the first interaction
		if (!interacted):
			PlayerData.score += score_chest_B
			interacted = true
		instruction.show() # Writes code at the scroll

# Player area verifier method
func _on_Area2D_body_entered(_player: KinematicBody2D):
	is_player_inside = true
	pass

# Player area verifier method
func _on_Area2D_body_exited(_player: KinematicBody2D):
	is_player_inside = false
	pass

func _on_AnimationPlayer_animation_finished(_anim_name: AnimatedSprite):
	instruction2.show() # Writes code at the scroll
	next_room = true
	pass
