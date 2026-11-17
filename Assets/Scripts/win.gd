extends Area2D

@export var next_level : String 
@export var lyrA_music : AudioStreamPlayer
@export var lyrB_music : AudioStreamPlayer
@export var win_screen : CanvasLayer
@export var timer : Timer
@export_enum("A" , "B") var layer : String

func _ready():
	$CollisionShape2D.add_to_group("Layer %s collisions" % layer)
	$CollisionShape2D.set_deferred("disabled" , (layer == "A") != GameData.in_layerA)

func win():
	timer.stop()
	$BigWin.play()
	lyrA_music.stop()
	lyrB_music.stop()
	$AnimatedSprite2D.play("win")
	GameData.level_stats[next_level] = true
	get_tree().change_scene_to_file("res://Assets/Scenes/Mains/main_menu.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		set_deferred("monitoring" , false)
		body.hide()
		body.set_physics_process(false)
		body.get_node("sfx/walk").stop()
		win()
