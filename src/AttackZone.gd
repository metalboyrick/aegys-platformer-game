extends Area2D

signal enter_zone()

func _physics_process(delta):
	var touch = get_overlapping_bodies()
	for body in touch:
		if "Enemy" in body.name:
			emit_signal("enter_zone")
		
