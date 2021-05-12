extends Area2D


var isClear = false
signal remind()
signal to_boss()

func _physics_process(delta):
	var touch = get_overlapping_bodies()
	for body in touch:
		if body.name == "Player" && isClear == true:
			emit_signal("to_boss")
		elif isClear == false:
			emit_signal("remind")
	

func _on_Interface2_stage_clear():
	isClear = true
