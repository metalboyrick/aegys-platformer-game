extends Control

signal resume()
signal restart()
signal mainmenu()
signal paused()


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		emit_signal("paused")
		set("visible", true)

func _on_Continue_pressed():
	emit_signal("resume")
	set("visible", false)
	pass # replace with function body

func _on_Restart_pressed():
	emit_signal("restart")
	pass # replace with function body

func _on_MainMenu_pressed():
	emit_signal("mainmenu")
	pass # replace with function body
