extends Area2D

var isClear = false
signal remind()

func _physics_process(delta):
	var touch = get_overlapping_bodies()
	print(touch)
	for body in touch:
		if body.name == "Player" && isClear == true:
			get_tree().change_scene("src/World3.tscn")
		elif isClear == false:
			emit_signal("remind")
	

func _on_Interface2_stage_clear():
	isClear = true
