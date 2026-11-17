extends Node
signal layer_change(in_a : bool)

var intro_played := false

var in_layerA := true :
	set(value):
		in_layerA = value
		layer_change.emit(value)
		get_tree().call_group("Layer A collisions" , "set_deferred" , "disabled" , not value)
		get_tree().call_group("Layer B collisions" , "set_deferred" , "disabled" , value)

var level_stats := {
	"level0" : true ,
	"level1" : false ,
	"level2" : false ,
	"level3" : false ,
	"level4" : false ,
	"level5" : false ,
	"level6" : false ,
	"level7" : false ,
	"level8" : false ,
	"level9" : false ,
	"level10" : false
	 }

# ignore this
# { unlocked : true , completed : false , time : 0.0 , deathes : 0}
