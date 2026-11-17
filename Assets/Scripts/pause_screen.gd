extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause()

func pause():
	visible = not visible
	get_tree().paused = visible

func _on_resume_pressed() -> void:
	pause()


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Mains/main_menu.tscn")
