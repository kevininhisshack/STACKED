extends CanvasLayer

@export var player : CharacterBody2D
@export var timer : Timer
@export var win : Area2D
@export var final_lvl : bool
var win_quote := ["good job , keep going." , "I knew you could do it." , "you are doing great , do not stop."]

func _ready() -> void:
	if final_lvl:
		$Control/Button.hide()





func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Mains/%s.tscn" % win.next_level)


func _on_replay_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Mains/main_menu.tscn")


func _on_visibility_changed() -> void:
	$Control/AnimationPlayer.play("drag in")
	timer.running = false
	$Control/Label.text = "fulfilment : " + str(player.point_counter)
	$Control/Label2.text = "deaths : " + str(player.deaths)
	$Control/Label3.text = "time : " + str(timer.elapsed)
