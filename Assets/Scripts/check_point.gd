extends Area2D

var x := 0
var y := 0
@export_enum("A" , "B") var layer : String


func _ready():
	$CollisionPolygon2D.add_to_group("Layer %s collisions" % layer)
	$CollisionPolygon2D.set_deferred("disabled" , (layer == "A") != GameData.in_layerA)
	x = position.x
	y = position.y

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.check_pointPOS = Vector2(x , y)
