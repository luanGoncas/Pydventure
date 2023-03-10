extends AnimatedSprite

var got_red: bool = false
var is_player_inside: bool = false
var painting3: Sprite
var painting_true2: Sprite
var instruction: Label
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
export var score_balance_equals = 50
var interacted: bool = false

func _ready():
	animation_player.play("idle")
	pass

func _input(event):
	if event.is_action_pressed("interact") and is_player_inside and got_red:
		animation_player.play("equals")
		if (!interacted):
			PlayerData.score += score_balance_equals
			interacted = true
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
	painting3.hide()
	painting_true2.show()
	pass # Replace with function body.
