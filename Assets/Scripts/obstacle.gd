extends Area2D

@export_enum("A" , "B") var layer : String

func _ready():
	$CollisionShape2D.add_to_group("Layer %s collisions" % layer)
	$CollisionShape2D.set_deferred("disabled" , (layer == "A") != GameData.in_layerA)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.death_func()
