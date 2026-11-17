extends Node

@onready var trackA := $Audio/trackA
@onready var trackB := $Audio/trackB

var master_idx := AudioServer.get_bus_index("Master")
var music_idx := AudioServer.get_bus_index("Music")
var sfx_idx := AudioServer.get_bus_index("SFX")

# layerA background : 1a222b
# layerB background : 2b1c22

var in_layerA := true :
	set(value):
		$logo.text = "STACKED" if value else "LEVELSS"
		var layer_col: Color 
		in_layerA = value
		layer_col = Color("1a222b") if value else Color("2b1c22")
		$background.color = layer_col
		$"Layer A".visible = value
		$"Layer B".visible = not value
		trackA.volume_db = 0 if value else -80
		trackB.volume_db = 0 if not value else -80

func _ready() -> void:
	in_layerA = in_layerA
	
	
	# check levels
	
	
	# audio stuff
	$"Layer A/settings/PanelContainer/audio settings/HSlider".value = db_to_linear((AudioServer.get_bus_volume_db(master_idx)))
	$"Layer A/settings/PanelContainer/audio settings/HSlider2".value = db_to_linear((AudioServer.get_bus_volume_db(music_idx)))
	$"Layer A/settings/PanelContainer/audio settings/HSlider3".value = db_to_linear((AudioServer.get_bus_volume_db(sfx_idx)))
	
	# intro sequence
	if GameData.intro_played == false:
		$Audio/intro.play()
		await get_tree().create_timer(8.75).timeout
		GameData.intro_played = true
		$logo.position.y = -60.0
		$intro.queue_free()
		trackA.play()
		trackB.play()
	else:
		$logo.position.y = -60.0
		$intro.queue_free()
		trackA.play()
		trackB.play()




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Mains/test_scene.tscn")


func _on_switch_pressed() -> void:
	in_layerA = not in_layerA

func _process(delta: float) -> void:
	pass


func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master") , linear_to_db(value))

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music") , linear_to_db(value))

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX") , linear_to_db(value))


func _on_settings_pressed() -> void:
	$"Layer A/settings".show()
	$Button.hide()


func _on_settings_back_pressed() -> void:
	$"Layer A/settings".hide()
	$Button.show()


func _on_credits_pressed() -> void:
	$"Layer A/credits".show()
	$logo.hide()
	$Button.hide()
	$"Layer A/options/Button".hide()
	$"Layer A/options/Button2".hide()

func _on_credits_back_pressed() -> void:
	$"Layer A/credits".hide()
	$logo.show()
	$Button.show()
	$"Layer A/options/Button".show()
	$"Layer A/options/Button2".show()
