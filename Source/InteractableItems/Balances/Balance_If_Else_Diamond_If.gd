extends AnimatedSprite

var next_animation: bool = false
var got_blue: bool = false
var is_player_inside: bool = false
var instruction: Label
#var instruction2: Label
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
export var score_balance_if_else_diamond_if = 100
var interactable: bool = false

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_blue:
		animation_player.play("if")
		if !interactable:
			PlayerData.score += score_balance_if_else_diamond_if
			interactable = true
		instruction.show()


func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.



func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	#instruction2.show()
	next_animation = true
	pass # Replace with function body.
