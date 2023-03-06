# Herda todos os atributos e métodos do tipo "Node2D"
extends Node2D

func _ready():
	# Configura a instrução a ser exibida ao interagir com a pintura da sala
	$Painting.instruction = $Player/Scroll/Label
	pass

func _process(delta):
	# Verifica se o tinteiro da fase foi coletado
	if get_node("Ink_Vase").collected:
		# Configura a variável collected como true, para que a animação seja executada
		$Painting.collected = true
