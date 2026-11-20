extends Timer

var elapsed := 0.0
var running := true

func _process(delta: float) -> void:
	if running:
		elapsed += delta

func time_formating(time : float):
	var mins = int(time / 60)
	var secs = int(time) % 60
	var cents = int((time - int(time)) * 100)
	return "%02d : %02d . %02d" % [mins , secs , cents]
