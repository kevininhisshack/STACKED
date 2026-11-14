extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		collected(body)

func collected(body):
	$AnimatedSprite2D.play("disapear")
	body.jumps += 1
	hide()
	$CollisionShape2D.set_deferred("disabled" , true)
	await get_tree().create_timer(5).timeout
	show()
	$AnimatedSprite2D.play("appear")
	$CollisionShape2D.set_deferred("disabled" , false)
