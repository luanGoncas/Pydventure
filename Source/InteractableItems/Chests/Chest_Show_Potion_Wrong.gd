extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_player_inside: bool = false
var got_potion: bool = false
var showed_potion: bool = false
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("idle")
	pass # Replace with function body.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and is_player_inside and got_potion:
		animation_player.play("show_potion")
		showed_potion = true


func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.


func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.
