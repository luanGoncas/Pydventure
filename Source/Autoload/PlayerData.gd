extends Node

signal score_updated
var score: = 0 setget set_score # Global variable for score

func reset() -> void:
	score = 0

# Setter
func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")
	return

func _ready():
	pass # Replace with function body.
