extends Node

@export var master := 100
@export var sfx := 50
@export var music := 50

func _ready():
	sfx = sfx * master
	music = music * master

# this is global ,
# plan is to make the audio and music and master
# changable in the settings ,
# idk how to make sliders tho
