extends Node

@onready var trackA = $Audio/layerA
@onready var trackB = $Audio/layerB

# layerA background : 1a222b
# layerA background : 2b1c22

var in_layerA := true :
	set(value):
		var layer_col: Color 
		in_layerA = value
		layer_col = Color("1a222b") if value else Color("2b1c22")
		$ColorRect.color = layer_col
		$"Layer A".visible = value
		$"Layer B".visible = not value
		trackA.volume_db = 0 if value else -80
		trackB.volume_db = 0 if not value else -80

func _ready() -> void:
	in_layerA = in_layerA


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Mains/test_scene.tscn")


func _on_switch_pressed() -> void:
	in_layerA = not in_layerA
