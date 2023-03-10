extends AnimatedSprite

var is_player_inside: bool = false
var right_chest: bool = false
var stop_pulley: bool = false
var instruction: Label
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
export var score_right_chest = 100
var interacted: bool = false

func _ready():
	animation_player.play("idle")
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and right_chest and is_player_inside:
		animation_player.play("show_potion")
		stop_pulley = true
		if !interacted:
			PlayerData.score += score_right_chest
			interacted = true
		instruction.show()


func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.


func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.
