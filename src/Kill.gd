
extends Label

var killCount = 0
signal _clear()

func _ready():
	killCount = 0

func _process(delta):
	set("text", str(killCount))
	pass
	
func _on_Interface__count_change():
	killCount += 1
	if killCount == 10:
		emit_signal("_clear")
	pass # replace with function body


