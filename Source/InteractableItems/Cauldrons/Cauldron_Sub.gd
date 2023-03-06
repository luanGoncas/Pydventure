extends AnimatedSprite

export(PackedScene) var object_target: PackedScene = null
var is_player_inside: bool = false
var got_potion: bool = false
var got_blue: bool
var got_red: bool
var is_opened: bool = false
var painting: Sprite

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var tween: Tween = get_node("Tween")

func _ready() -> void:
	assert(object_target != null)
	animation_player.play("idle")
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and is_player_inside and not is_opened and got_blue:
		is_opened = true
		animation_player.play("get_blue_potion")
	if event.is_action_pressed("interact") and is_player_inside and not is_opened and got_red:
		is_opened = true
		animation_player.play("get_red_potion")

func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.


func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if is_opened and got_blue and got_red:
		var object: Node2D = object_target.instance()
		owner.add_child(object)
		tween.interpolate_property(object, "position", position, position + Vector2(0, -10), 0.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
		yield(tween, "tween_completed")
		tween.interpolate_property(object, "position", position, position + Vector2(0, -5), 0.5, Tween.TRANS_SINE, Tween.EASE_IN)
		tween.start()
		hide()
		got_potion = true
	if anim_name == "get_red_potion" or anim_name == "get_blue_potion":
		is_opened = false
		_ready()
