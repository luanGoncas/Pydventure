extends AnimatedSprite

var got_green: bool = false
var is_player_inside: bool = false
var painting: Sprite
var painting_true: Sprite
var instruction: Label
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_green:
		animation_player.play("minor")
		instruction.show()

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	painting.hide()
	painting_true.show()
	pass # Replace with function body.


func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.


func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.
