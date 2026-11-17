extends Area2D

@export var camPOS := Vector2.ZERO
@export var camZOOM := Vector2.ONE
@export var transition_time := 0.5
@export var display_time := 0.0
@export_enum("A" , "B") var layer : String

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	camPOS.x = position.x
	camPOS.y = position.y
	$CollisionPolygon2D.add_to_group("Layer %s collisions" % layer)
	$CollisionPolygon2D.set_deferred("disabled" , (layer == "A") != GameData.in_layerA)

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
		
	get_tree().call_group("camera" , "enter_trigger" , self)
	if display_time > 0.0:
		await get_tree().create_timer(display_time).timeout
		get_tree().call_group("camera" , "exit_trigger" , self)
		queue_free()


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().call_group("camera" , "exit_trigger" , self)
