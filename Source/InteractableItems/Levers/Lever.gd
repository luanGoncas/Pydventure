extends Area2D

var is_player_inside: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("idle")
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside:
		$AnimatedSprite.play("action")
		SceneChanger.change_scene("res://Source/Levels/Level_07.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Lever_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.


func _on_Lever_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.
