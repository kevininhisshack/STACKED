extends Area2D

@export var next_level : String = "LVL1"

func win():
	$AnimatedSprite2D.play("win")
	# win sfx when made
	# then await win sfx ending ,  and make the win screen visible



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.queue_free() # the win animation will have the player in it
		win()
