extends AnimatedSprite

var is_player_inside: bool = false
var dead: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside:
		play("death")

func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.



func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.


func _on_Crdex_animation_finished():
	dead = true
#	get_node(".").hide()
#	get_node("Area2D/CollisionShape2D").disabled = true
	pass # Replace with function body.
