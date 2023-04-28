extends AnimatedSprite

export(PackedScene) var object_target: PackedScene = null # Result potion generator
var is_player_inside: bool = false # Player area verifier
var got_potion: bool = false # Result potion verifier
var got_blue: bool # Blue potion verifier
var got_red: bool # Red potion verifier
var is_opened: bool = false # Cauldron interaction verifier
var painting: Sprite # Blank painting sprite

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations
onready var tween: Tween = get_node("Tween") # Tween that will make the result potion movement

func _ready() -> void:
	assert(object_target != null) # The object target from cauldron must be set
	animation_player.play("idle")
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and is_player_inside and not is_opened and got_blue:
		is_opened = true
		animation_player.play("get_blue_potion")
	if event.is_action_pressed("interact") and is_player_inside and not is_opened and got_red:
		is_opened = true
		animation_player.play("get_red_potion")

# Player area verifier method
func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass # Replace with function body.

# Player area verifier method
func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass # Replace with function body.

# Result potion generator method
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if is_opened and got_blue and got_red:
		var object: Node2D = object_target.instance() # Result potion instantiate
		owner.add_child(object)
		
		# Result potion movement
		tween.interpolate_property(object, "position", position, position + Vector2(0, -10), 0.5, Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.start()
		yield(tween, "tween_completed")
		tween.interpolate_property(object, "position", position, position + Vector2(0, -5), 0.5, Tween.TRANS_SINE, Tween.EASE_IN)
		tween.start()
		hide() # The cauldron vanishes
		got_potion = true
	
	# The cauldron must receive the blue potion and the red potion
	if anim_name == "get_red_potion" or anim_name == "get_blue_potion":
		is_opened = false
		_ready()
