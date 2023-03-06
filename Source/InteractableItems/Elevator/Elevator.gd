extends KinematicBody2D

# Intervalo de andares do elevador
export(int, 0, 5) var levels = 0

# Variável que verifica a distância percorrida
export var distance = 0

# Variável que verifica se o elevador está sendo usado
var using: bool = false

# Variável para mover o elevador
var move: Vector2

# Variável que configura a física do elevador
var t: float = 0

# Variável que verifica o andar atual do elevador
var level_at: int = 0

# Variável que verifica se o jogador entrou no elevador
var player_entered: bool = false

# Variável para confirmar que o jogador selecionou a opçao correta
var right_answer: bool = false

# Variáveis para imprimir as instruções no pergaminho
var instruction: Label
var instruction2: Label
var instruction3: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	move = global_position
	pass # Replace with function body.

func _input(event):
	if !using:
		return
	if event.is_action_pressed("interact") and level_at < levels:
		player_entered = true
		if right_answer:
			instruction.show()
			move.y -= distance
			move.x += distance
			t = 0
			level_at += 1
			if level_at == 2:
				instruction2.show()
			if level_at == levels:
				instruction3.show()
			print(move.x)
			print(move.y)
			print(level_at)
			right_answer = false

func _physics_process(delta):
	if move != global_position:
		t =+ delta * .3
		global_position = global_position.linear_interpolate(move, t)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	using = true
	pass # Replace with function body.


func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	player_entered = false
	using = false
	pass # Replace with function body.
