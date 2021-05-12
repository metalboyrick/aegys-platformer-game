extends Area2D

var eligible = false
signal remind()

func _physics_process(delta):
	var touch = get_overlapping_bodies()
	for body in touch:
		if body.name == "Player" && eligible == true:
			get_tree().change_scene("src/World2.tscn")
		elif eligible == false:
			emit_signal("remind")
			
	
		

func _on_Interface2_stage_clear():
	eligible = true
	pass # replace with function body
