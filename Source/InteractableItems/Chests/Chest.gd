# Herda todos os atributos e métodos do tipo "AnimatedSprite"
extends AnimatedSprite

# Variável utilizada para puxar a cena referente ao objeto liberado pelo baú
export(PackedScene) var object_scene: PackedScene = null

# Variável usada para imprimir texto no pergaminho
var helloLabel: Label

# Variável usada para para verificar se o jogador está dentro da área de interação 
var is_player_inside: bool = false

# Variável usada para identificar se o baú está aberto ou não
var is_opened: bool = false

# Variável que irá pegar o filho do tipo "AnimationPlayer" para utilizar todas as animações do baú
onready var animation_player: AnimationPlayer = get_node("AnimationPlayer")

# Variável utilizada para interpolar a posição em que o objeto do baú será inicializado na tela
onready var tween: Tween = get_node("Tween")

# Função pré-processada antes da execução
func _ready() -> void:
	
	# A função assert aborta o programa caso a variável object_scene, o objeto gerado, for vazio
	assert(object_scene != null)
	
	# Função que reproduz a animação "Idle" do baú, contida no filho "AnimationPlayer"
	animation_player.play("Idle")
	pass

# Função que trata as entradas enviadas pelo jogador
func _input(event: InputEvent) -> void:
	
	# Verifica se: O jogador apertou a tecla "Up"; está dentro da área de interação; o baú está fechado
	if event.is_action_pressed("interact") and is_player_inside and not is_opened:
		
		# Torna a variável is_opened verdadeira, representando que o baú será aberto
		is_opened = true
		
		# Função que reproduz a animação "Opening" do baú, contida no filho "AnimationPlayer", mostrando o baú abrindo
		animation_player.play("Opening")
		
		# Libera o texto oculto contido no pergaminho, texto este contido dentro do objeto "Label"
		#helloLabel.show()
		#helloLabel.text = "olá"
	else:
		
		# Exibição na tela do console para teste de algum erro
		print(is_player_inside)

# Função que irá liberar o objeto dentro do baú
func _drop_object() -> void:
	
	# Variável utilizada para instanciar a cena em ordem hierárquica, ou seja, o objeto dentro do baú
	var object: Node2D = object_scene.instance()
	
	# Transforma a cena objeto, o objeto dentro do baú, em um filho do baú
	owner.add_child(object)
	#owner.get_node("Objects").add_child(object)
	
	# Estipula o primeiro movimento e coordenadas feitas pelo objeto liberado pelo baú
	tween.interpolate_property(object, "position", position + Vector2(0, -5), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)
	
	# Inicia o primeiro movimento baseado nas coordenadas estipuladas
	tween.start()
	
	# A função yield confirma se o movimento terminou
	yield(tween, "tween_completed")
	
	# Estipula o segundo movimento e coordenadas feitas pelo objeto liberado pelo baú
	tween.interpolate_property(object, "position", position + Vector2(0, -5), position, 0.3, Tween.TRANS_SINE, Tween.EASE_IN)
	
	# Inicia o segundo movimento baseado nas coordenadas estipuladas
	tween.start()

# Função que verifica se o jogador entrou na área de interação
func _on_Area2D_player_entered(_player: KinematicBody2D) -> void:
	is_player_inside = true
	pass

# Função que verifica se o jogador saiu da área de interação
func _on_Area2D_player_exited(_player: KinematicBody2D) -> void:
	is_player_inside = false
	pass
