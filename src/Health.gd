extends Label

var healthCount = 8

func _ready():
	healthCount = 8

func _process(delta):
	set("text", str(healthCount))
	pass
	

func _on_HealthMid__health_change():
	healthCount -= 1
	pass # replace with function body
