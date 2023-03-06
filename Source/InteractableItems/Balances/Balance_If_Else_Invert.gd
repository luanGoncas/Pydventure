extends AnimatedSprite

var got_blue: bool = false
var is_player_inside: bool = false
var painting2: Sprite
var painting_false: Sprite
var instruction: Label
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("idle")
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_blue:
		animation_player.play("action_invert")
		instruction.show()


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	painting2.hide()
	painting_false.show()
	pass # Replace with function body.


func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.


func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.
