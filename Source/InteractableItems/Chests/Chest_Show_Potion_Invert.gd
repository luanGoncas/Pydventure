# Herda todos os atributos e métodos do tipo "AnimatedSprite"
extends AnimatedSprite

# Variável usada para identificar se o baú está aberto ou não
var is_opened: bool = false

# Variável usada para confirmar a abertura do baú A
var opened_chests: bool = false

# Variável que irá pegar o filho do tipo "AnimationPlayer" para utilizar todas as animações do baú
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

# Função pré-processada antes da execução
func _ready():
	# Função que reproduz a animação "Idle" do baú, contida no filho "AnimationPlayer"
	animation_player.play("idle")
	pass

func _process(delta):
	if opened_chests:
		# Função que reproduz a animação "show_potion" do baú, contida no filho "AnimationPlayer", mostrando o baú copiando a exibindo a poção
		animation_player.play("show_potion")

# Função que verifica se a animação do baú foi finalizada
func _on_AnimationPlayer_animation_finished(_anim_name: AnimatedSprite):
	opened_chests = false
	pass # Replace with function body.
