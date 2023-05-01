extends KinematicBody2D

const UP = Vector2(0, -1) # Constant for vertical movements
const GRAVITY = 20 # Constat for game gravity Constante utilizada para configurar a gravidade do jogo
const ACCELERATION = 50 # Constant for player acceleration
const MAX_SPEED = 200 # Constant to unable infinite acceleration
const JUMP_HEIGHT = -500 # Constant that sets the jump height of the player
var motion = Vector2() # Variable for bidimensional movement

func _ready() -> void:
	
	# Sets and/or updates the score UI of the player
	PlayerData.connect("score_updated", self, "update_interface")
	update_interface()

func _physics_process(delta):
	motion.y += GRAVITY # Calculates if the player is falling or jumping
	var friction = false # Calculates the friction, the player "sliding"
	
	if Input.is_action_pressed("walk_right"):
		
		# Player walks to the right according to the minimum value between acceleration and maximum speed
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		
		$Sprite.flip_h = false # Avoids sprite invertion
		$Sprite.play("Run") # Player running animation
		
	elif Input.is_action_pressed("walk_left"):
		
		# Player walks to the right according to the maximum value between acceleration and maximum speed
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true # Inverts sprite
		$Sprite.play("Run") # Player running animation
	else:
		$Sprite.play("Idle") # Idle animation
		friction = true
	
	# Checks if the player is in contact with the ground
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = JUMP_HEIGHT # Vertical movement
			
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2) # The lerp function slows down based on the third parameter given
	else:
		
		# Verify if there is vertical movement
		# (In Godot, Upper Y quadrants are represented by negative numbers)
		if motion.y < 0:
			$Sprite.play("Jump") # Player jumping animation
		else:
			$Sprite.play("Fall") # Player falling animation
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05) # Slows down based on the third parameter given
	
	motion = move_and_slide(motion, UP)
	
	pass

# Score UI function
func update_interface() -> void:
	$Score.text = "Pontos: %s" % PlayerData.score
