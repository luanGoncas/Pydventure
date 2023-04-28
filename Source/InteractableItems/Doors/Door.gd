extends Area2D

var level_clear: bool = false # Confirms all stage tasks were done
var door_open: bool = false # Door open verifier
var is_player_inside: bool = false

func _ready():
	$AnimationPlayer.play("close")
	pass

func _input(event):
	if event.is_action_pressed("interact") and level_clear and is_player_inside:
		$AnimationPlayer.play("open")

func _on_AnimationPlayer_animation_finished(anim_name):
	door_open = true
	pass # Replace with function body.


func _on_Door_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.


func _on_Door_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.
