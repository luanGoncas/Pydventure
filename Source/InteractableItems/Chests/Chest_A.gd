extends AnimatedSprite

var is_player_inside: bool = false # Player area verifier
var is_opened: bool = false # Chest open verifier
var instruction: Label # Label that will write the code at player scroll
var got_potion: bool = false # Potion verifier
var opened_A: bool = false # Chest open verifier
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_chest_A = 25 # Object default score value
var interacted: bool = false # Interaction verifier

func _ready() -> void:
	animation_player.play("idle")
	pass

func _input(event: InputEvent) -> void:
	
	# Checks if the player interacted with chest and got the level potion
	if event.is_action_pressed("interact") and is_player_inside and not is_opened and got_potion:
		is_opened = true
		opened_A = true
		animation_player.play("get_potion")
		PlayerData.score += score_chest_A
		instruction.show() # Writes code at scroll
		
# Player area verifier method
func _on_Area2D_body_entered(_player: KinematicBody2D):
	is_player_inside = true
	pass

# Player area verifier method
func _on_Area2D_body_exited(_player: KinematicBody2D):
	is_player_inside = false
	pass

func _on_AnimationPlayer_animation_finished(_anim_name: AnimatedSprite):
	# queue_free()
	pass 
