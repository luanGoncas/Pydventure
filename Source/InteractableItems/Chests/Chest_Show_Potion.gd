extends AnimatedSprite

var next_animation: bool = false # Allows the next animations

# Chests open verifiers
var is_opened: bool = false
var opened_chests: bool = false

onready var animation_player: AnimationPlayer = get_node("AnimationPlayer") # Object animations

func _ready():
	animation_player.play("idle")
	pass

func _process(delta):
	if opened_chests:
		animation_player.play("show_potion")

# Sets the other objects animations at present level
func _on_AnimationPlayer_animation_finished(_anim_name: AnimatedSprite):
	next_animation = true
	opened_chests = false
	pass # Replace with function body.
