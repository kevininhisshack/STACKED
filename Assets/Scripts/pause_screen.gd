extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	$"PanelContainer/audio settings/HSlider".value = db_to_linear((AudioServer.get_bus_volume_db(0)))
	$"PanelContainer/audio settings/HSlider2".value = db_to_linear((AudioServer.get_bus_volume_db(1)))
	$"PanelContainer/audio settings/HSlider3".value = db_to_linear((AudioServer.get_bus_volume_db(2)))


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
	

func _on_settings_pressed() -> void:
	$PanelContainer.visible = not $PanelContainer.visible

func _on_settings_back_pressed() -> void:
	$PanelContainer.visible = not $PanelContainer.visible

func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master") , linear_to_db(value))

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music") , linear_to_db(value))

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX") , linear_to_db(value))
