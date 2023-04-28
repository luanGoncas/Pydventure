extends AnimatedSprite

var is_player_inside: bool = false # Player area verifier
var got_potion: bool = false # Potion verifier
var showed_potion: bool = false # Chest animation verifier
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
export var score_wrong_chest = -25 # Object default score value
var interacted: bool = false # Interaction verifier

func _ready():
	animation_player.play("idle")
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and is_player_inside and got_potion:
		animation_player.play("show_potion")
		
		# If the player didn't interact with it, his score will raise at the first interaction
		if !interacted:
			PlayerData.score += score_wrong_chest
			interacted = true
		showed_potion = true


func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass


func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass
