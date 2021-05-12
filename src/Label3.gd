extends Label

func _on_Player__complain():
	set("visible", true)
	$Timer.start()
	pass # replace with function body


func _on_Timer_timeout():
	set("visible", false)
	pass # replace with function body
