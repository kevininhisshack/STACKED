extends Node

@export var bg : ColorRect
@export var layerA : Node2D
@export var layerB : Node2D
@export var trackA : AudioStreamPlayer
@export var trackB : AudioStreamPlayer

func _ready() -> void:
	GameData.layer_change.connect(_update)
	_update(GameData.in_layerA)
	

func _update(in_a : bool):
	bg.color = Color("1a222b") if in_a else Color("2b1c22")
	layerA.visible = in_a
	layerB.visible = not in_a
	trackA.volume_db = 0 if in_a else -80
	trackB.volume_db = 0 if not in_a else -80
