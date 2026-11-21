extends Area2D

@export_enum("A" , "B") var layer : String

func _ready() -> void:
	$CollisionShape2D.add_to_group("Layer %s collisions" % layer)
	$CollisionShape2D.set_deferred("disabled" , (layer == "A") != GameData.in_layerA)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		collected(body)

func collected(body):
	$CollisionShape2D.set_deferred("disabled" , true)
	body.jump_orb_touched = true
	body.get_node("AnimationPlayer").play("jumporb")
	var pitch = randf_range(0.8 , 1.5)
	$AudioStreamPlayer2D.pitch_scale = pitch
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.play("disapear")
	body.jumps += 1
	
	await $AnimatedSprite2D.animation_finished
	
	hide()
	
	await get_tree().create_timer(4).timeout
	
	show()
	$AnimatedSprite2D.play("appear")
	$CollisionShape2D.set_deferred("disabled" , false)
	
	await get_tree().create_timer(0.3).timeout
	
	$AnimatedSprite2D.play("idle")
