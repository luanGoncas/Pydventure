extends Area2D

var collected: bool = false # Collectable item verifier

# Collectable item area method
func _on_Potion_body_entered(_player: KinematicBody2D):
	collected = true
	$Sprite.hide() # Hides the item collected
	pass

# Collectable item area method
func _on_Ink_Vase_body_entered(_player: KinematicBody2D):
	collected = true
	$Sprite.hide() # Hides the ink vase collected
	pass
