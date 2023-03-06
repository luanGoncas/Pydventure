extends AnimatedSprite

var got_potion: bool = false
var is_player_inside: bool = false
var activate_chests: bool = false
var instruction: Label
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

func _ready():
	animation_player.play("idle")
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_potion:
		animation_player.play("spin")
		activate_chests = true
		instruction.show()


func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.


func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.
