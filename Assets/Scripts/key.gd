extends Area2D

@export var gate : Node 


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$KeyCatch.play()
		$AnimatedSprite2D.hide()
		$CollisionShape2D.set_deferred("disable" , true)
		gate.num_of_keys -= 1
		gate.check_keys()
		await $KeyCatch.finished
		queue_free()
