extends CanvasLayer

@export var player : CharacterBody2D
@export var timer : Timer
@export var win : Area2D
@export var first_lvl : bool
@export var second_to_last : bool
@export var final_lvl : bool

var win_quotes := ["Good job , keep going." , "I knew you could do it." , "You are doing great , do not stop."]

func _ready() -> void:
	var choose_quote := randi_range(0 , 2)
	
	$"Control/win quote".text = win_quotes[choose_quote]
	
	if first_lvl:
		$Control/Label.hide()
	
	if final_lvl:
		$Control/Button.hide()
		$"Control/win quote".text = "Good bye."
	
	if second_to_last:
		$"Control/win quote".text = "..."

func _process(delta: float) -> void:
	if visible == true:
		timer.running = false
	
	$Control/Label.text = "fulfilments : " + str(player.point_counter) + " / 3"
	$Control/Label2.text = "deaths : " + str(player.deaths)
	$Control/Label3.text = "time : " + str(timer.time_formating(timer.elapsed))

func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Mains/%s.tscn" % win.next_level)


func _on_replay_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Mains/main_menu.tscn")


func _on_visibility_changed() -> void:
	$Control/AnimationPlayer.play("drag in")
