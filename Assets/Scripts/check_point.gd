extends Area2D

@export var x := 0
@export var y := 0
# ok nate , do not give this subscene the collider,
# make the code for touching it and then when we
# add it to the levels we can give it a collider
# child for custom collisions every check point

func _ready():
		x = position.x
		y = position.y

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.check_pointPOS = Vector2(x , y)
