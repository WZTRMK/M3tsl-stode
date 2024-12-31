extends Area2D

var direction  = Vector2.ZERO
var speed = 400

func set_direction(dir):
	direction = dir
	rotation = dir.angle()

func _process(delta : float) -> void:
	position += direction * speed * delta

	pass
