extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		collected(body)

func collected(body):
	var pitch = randf_range(0.8 , 1.5)
	$AudioStreamPlayer2D.pitch_scale = pitch
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play("disapear")
	body.jumps += 1
	await get_tree().create_timer(0.3).timeout
	hide()
	$CollisionShape2D.set_deferred("disabled" , true)
	await get_tree().create_timer(5).timeout
	show()
	$AnimatedSprite2D.play("appear")
	$CollisionShape2D.set_deferred("disabled" , false)
	await get_tree().create_timer(0.3).timeout
	$AnimatedSprite2D.play("idle")
