# Herda todos os atributos e métodos do tipo "Node2D"
extends Node2D

# Função pré-processada antes da execução
func _ready():
	# Atribui a variável 'instruction' o valor do objeto especificado
	$Chests/Chest_A.instruction = $Player/Scroll/Label
	
	# Atribui a variável 'instruction' o valor do objeto especificado
	$Chests/Chest_B.instruction = $Player/Scroll/Label2
	
	# Atribui a variável 'instruction2' o valor do objeto especificado
	$Chests/Chest_B.instruction2 = $Player/Scroll/Label3
	pass

# Função executada após a execução da cena
func _process(delta):
	
	if get_node("Potion").collected:
		$Chests/Chest_A.got_potion = true
	
	# Verifica se a variável 'opened_A', do objeto 'Chest_A', está configurada como 'true'
	if get_node("Chests/Chest_A").opened_A:
		
		# Atribui à variável 'opened_A', do objeto 'Chest_B', o valor 'true'
		$Chests/Chest_B.opened_A = true
	pass
