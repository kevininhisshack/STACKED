extends Camera2D

var default_zoom := zoom
var active_trigger : Area2D = null
var active_time := 0.5

func enter_trigger(trigger : Node):
	active_trigger = trigger
	active_time = trigger.transition_time
	var start := global_position
	top_level = true
	global_position = start
	var tween := create_tween().set_parallel()
	tween.tween_property(self , "global_position" , trigger.camPOS , active_time)
	tween.tween_property(self , "zoom" , trigger.camZOOM , active_time)

func exit_trigger(trigger : Node):
	if active_trigger != trigger:
		return
	active_trigger = null
	var tween := create_tween().set_parallel()
	tween.tween_property(self , "global_position" , get_parent().global_position , active_time)
	tween.tween_property(self , "zoom" , default_zoom , active_time)
	await tween.finished
	if active_trigger == null:
		top_level = false
		position = Vector2.ZERO
