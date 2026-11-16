extends Area2D

@export var gate : Node 
@export_enum("A" , "B") var layer : String

func _ready():
	$CollisionShape2D.add_to_group("Layer %s collisions" % layer)
	$CollisionShape2D.set_deferred("disabled" , (layer == "A") != GameData.in_layerA)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$KeyCatch.play()
		$AnimatedSprite2D.hide()
		$CollisionShape2D.set_deferred("disable" , true)
		gate.num_of_keys -= 1
		gate.check_keys()
		await $KeyCatch.finished
		queue_free()
