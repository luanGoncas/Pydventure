extends KinematicBody2D

var reset_position: Vector2
export(int, 0, 5) var levels = 0 # Elevator levels
export var distance = 0 # Distance traversed
var using: bool = false # Elevator using verifier
var move: Vector2 # Elevator moving variable
var t: float = 0 # Sets elevator physics
var level_at: int = 0 # Checks elevator current level
var player_entered: bool = false # Player area verifier
var right_answer: bool = false # Question answer verifier
var wrong_answer: bool = false # Question answer verifier

# Scroll instructions settings
var instruction: Label
var instruction2: Label
var instruction3: Label

func _ready():
	
	# Sets elevator position at the game
	move = global_position
	reset_position = global_position # Default elevator initial position
	pass # Replace with function body.

func _input(event):
	if !using:
		return
	if event.is_action_pressed("interact") and level_at < levels:
		player_entered = true # Confirms that the player is inside the elevator and using it
		if right_answer:
			instruction.show() # Writes code at the scroll
			
			# The elevator moves
			move.y -= distance
			move.x += distance
			t = 0
			level_at += 1 # Increases the elevator level
			
			if level_at == 2:
				instruction2.show() # Writes code at the scroll
			if level_at == levels:
				instruction3.show() # Writes code at the scroll
			
			# Debugging prints only
#			print(move.x)
#			print(move.y)
#			print(level_at)
			right_answer = false
		if wrong_answer:
			level_at = 0
			move = reset_position
			wrong_answer = false

func _physics_process(delta):
	if move != global_position:
		t =+ delta * .3
		global_position = global_position.linear_interpolate(move, t)

# Player area verifier method
func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	using = true
	pass

# Player area verifier method
func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	player_entered = false
	using = false
	pass
