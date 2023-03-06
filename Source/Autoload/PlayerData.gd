extends Node

signal score_updated
var score: = 0 setget set_score

func reset() -> void:
	score = 0

func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")
	return

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
