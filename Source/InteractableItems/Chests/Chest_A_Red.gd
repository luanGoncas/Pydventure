# Herda todos os atributos e métodos do tipo "AnimatedSprite"
extends AnimatedSprite

# Variável usada para para verificar se o jogador está dentro da área de interação
var is_player_inside: bool = false

# Variável usada para identificar se o baú está aberto ou não
var is_opened: bool = false

# Variável usada para imprimir texto no pergaminho
var instruction: Label

var got_potion: bool = false

# Variável que irá pegar o filho do tipo "AnimationPlayer" para utilizar todas as animações do baú
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

# Função pré-processada antes da execução
func _ready() -> void:
	
	# Função que reproduz a animação "Idle" do baú, contida no filho "AnimationPlayer"
	animation_player.play("idle")
	pass

# Função que trata as entradas enviadas pelo jogador
func _input(event: InputEvent) -> void:
	# Verifica se: O jogador apertou a tecla "Up"; está dentro da área de interação; o baú está fechado;
	if event.is_action_pressed("interact") and is_player_inside and not is_opened and got_potion:
		
		# Torna a variável is_opened verdadeira, representando que o baú será aberto
		is_opened = true
		
		# Função que reproduz a animação "get_potion" do baú, contida no filho "AnimationPlayer", mostrando o baú recebendo a poção
		animation_player.play("get_potion")
		
		# Libera o texto oculto contido no pergaminho, texto este contido dentro do objeto "Label"
		instruction.show()
		
# Função que verifica se o jogador entrou na área de interação
func _on_Area2D_body_entered(_player: KinematicBody2D):
	is_player_inside = true
	pass # Replace with function body.

# Função que verifica se o jogador saiu na área de interação
func _on_Area2D_body_exited(_player: KinematicBody2D):
	is_player_inside = false
	pass # Replace with function body.

# Função que verifica se a animação do baú foi finalizada
func _on_AnimationPlayer_animation_finished(_anim_name: AnimatedSprite):
	# queue_free()
	pass # Replace with function body.
