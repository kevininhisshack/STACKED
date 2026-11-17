extends Timer

var elapsed := 0.0
var running := true

func _process(delta: float) -> void:
	if running:
		elapsed += delta
