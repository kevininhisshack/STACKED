extends Area2D

@export var x := 0
@export var y := 0

func _ready():
		x = position.x
		y = position.y

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.check_pointPOS = Vector2(x , y)
