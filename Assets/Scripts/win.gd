extends Area2D

@export var next_level : String = "level1"
@export_enum("A" , "B") var layer : String

func _ready():
	$CollisionShape2D.add_to_group("Layer %s collisions" % layer)
	$CollisionShape2D.set_deferred("disabled" , (layer == "A") != GameData.in_layerA)

func win():
	$AnimatedSprite2D.play("win")
	# win sfx when made
	# then await win sfx ending ,  and make the win screen visible
	GameData.level_stats[next_level] = true


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		set_deferred("monitoring" , false)
		body.hide()
		body.set_physics_process(false)
		body.get_node("sfx/walk").stop()
		win()
