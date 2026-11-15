extends Node

@onready var trackA := $Audio/trackA
@onready var trackB := $Audio/trackB

# layerA background : 1a222b
# layerB background : 2b1c22

var in_layerA := true :
	set(value):
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
	
	# intro sequence
	$Audio/intro.play()
	await get_tree().create_timer(8.75).timeout
	$logo.position.y = -60.0
	$intro.queue_free()  # make it fade out instead of delete
	trackA.play()
	trackB.play()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Mains/test_scene.tscn")


func _on_switch_pressed() -> void:
	in_layerA = not in_layerA

func _process(delta: float) -> void:
	pass
