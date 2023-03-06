extends KinematicBody2D # Herda todos os atributos e métodos do tipo "AnimatedSprite"

const UP = Vector2(0, -1) # Constante utilizada para o movimento na vertical
const GRAVITY = 20 # Constante utilizada para configurar a gravidade do jogo
const ACCELERATION = 50 # Constante utilizada para acelerar o jogador de acordo com o movimento
const MAX_SPEED = 200 # Constante utilizada para que não haja aceleração infinita
const JUMP_HEIGHT = -500 # Constante utilizada para determinar a altura do pulo do jogador

#onready var score: Label = get_node("Score")
var motion = Vector2() # Variável que configura o movimento bidimensional

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	update_interface()

func _physics_process(delta):
	motion.y += GRAVITY # Configuração da gravidade, quando o jogador estiver caindo ou pulando
	var friction = false # Configura o cisalhamento, ou fricção, ou seja, o "escorregar" no atual momento
	
	# Condição que verifica se foi feito o movimento para caminhar a direita
	if Input.is_action_pressed("walk_right"):
		# O jogador se move para a direita de acordo com o valor mínimo entre a aceleração e a velocidade máxima
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		
		$Sprite.flip_h = false # Evita que o sprite do jogador seja invertido
		$Sprite.play("Run") # Reproduz a animação do jogador correndo
		
	# Condição que verifica se foi feito o movimento para caminhar a esquerda
	elif Input.is_action_pressed("walk_left"):
		
		# O jogador se move para a esquerda de acordo com o valor máximo entre a aceleração e a velocidade máxima
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true # Inverte o sprite do jogador, já que está se movendo no sentido oposto ao padrão
		$Sprite.play("Run") # Reproduz a animação do jogador correndo
	else:
		$Sprite.play("Idle") # Animação do jogador parado
		friction = true # Ativa o cisalhamento
	
	# Condição que verifica se o jogador está em contato com o chão
	if is_on_floor():
		
		# Condição que verifica se o jogador enviou uma entrada ao apertar a barra de espaço
		if Input.is_action_pressed("jump"):
			motion.y = JUMP_HEIGHT # Faz o movimento vertical
			
		# Verifica se há cisalhamento/fricção
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2) # A função lerp reduz a velocidade baseada no terceiro parâmetro dado
	else:
		
		# Condição que verifica se há locomoção na vertical
		# (Os quadrantes de Y superiores são representados por números negativos)
		if motion.y < 0:
			$Sprite.play("Jump") # Reproduz a animação do jogador pulando
		else:
			$Sprite.play("Fall") # Reproduz a animação do jogador caindo
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05) # Reduz a velocidade baseada no terceiro parâmetro
	
	motion = move_and_slide(motion, UP)
	
	pass

func update_interface() -> void:
	$Score.text = "Score: %s" % PlayerData.score
