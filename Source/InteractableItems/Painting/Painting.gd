# Herda todos os atributos e métodos do tipo "AnimatedSprite"
extends AnimatedSprite

# Variável usada para para verificar se o jogador está dentro da área de interação
var is_player_inside: bool = false

# Variável usada para identificar se o tinteiro foi coletado
var collected: bool = false

# Variável usada para imprimir texto no pergaminho
var instruction: Label

# Variável que irá pegar o filho do tipo "AnimationPlayer" para utilizar todas as animações da pintura
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")
onready var animated_sprite: AnimatedSprite = get_node(".")

export var score_painting: = 50
var interacted: bool = false

# Função pré-processada antes da execução
func _ready():
	
	# Função que reproduz a animação "Idle" da pintura, contida no filho "AnimationPlayer"
	animation_player.play("idle")
	pass

# Função que trata as entradas enviadas pelo jogador
func _input(event: InputEvent):
	
	# Verifica se: O jogador apertou a tecla "Up"; está dentro da área de interação; o tinteiro foi coletado;
	if event.is_action_pressed("interact") and is_player_inside:
		if collected:
			# Função que reproduz a animação "print" do baú, contida no filho "AnimationPlayer", mostrando a pintura escrevendo algo
			animation_player.play("print")
			if (!interacted):
				PlayerData.score += score_painting
				interacted = true
			# Libera o texto oculto contido no pergaminho, texto este contido dentro do objeto "Label"
			instruction.show()
			
func _process(delta):
	print(PlayerData.score)

# Função que verifica se o jogador entrou na área de interação
func _on_Area2D_body_entered(_player: KinematicBody2D):
	is_player_inside = true
	pass # Replace with function body.

# Função que verifica se o jogador saiu na área de interação
func _on_Area2D_body_exited(_player: KinematicBody2D):
	is_player_inside = false
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	# PlayerData.score += score
	pass # Replace with function body.
