extends Area2D

var is_player_inside: bool = false
var dead: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("casting_spell")
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside:
		$AnimationPlayer.play("death")
		
func _on_AnimationPlayer_animation_finished(anim_name):
	dead = true
	pass # Replace with function body.


func _on_Crdex_2_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.



func _on_Crdex_2_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.
