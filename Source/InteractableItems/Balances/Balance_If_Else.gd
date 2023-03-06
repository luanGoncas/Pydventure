extends AnimatedSprite

var next_animation: bool = false
var got_blue: bool = false
# var got_red: bool = false
var is_player_inside: bool = false
var instruction: Label
var instruction2: Label
var painting_maior: Sprite
var painting: Sprite
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_blue:
		animation_player.play("action")
		instruction.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.


func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	instruction2.show()
	painting.hide()
	painting_maior.show()
	next_animation = true
	pass # Replace with function body.
