# Herda todos os atributos e métodos do tipo "Area2D"
extends Area2D

# Confirma se o item coletável foi obtido
var collected: bool = false

# Função de coleta da poção
func _on_Potion_body_entered(_player: KinematicBody2D):
	collected = true
	# Oculta o sprite da poção da tela
	$Sprite.hide()
	#queue_free()
	pass

# Função de coleta do tinteiro
func _on_Ink_Vase_body_entered(_player: KinematicBody2D):
	collected = true
	
	# Oculta o sprite do tinteiro da tela
	$Sprite.hide()
	#queue_free()
	pass # Replace with function body.
