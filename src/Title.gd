extends Control


func _ready():
	$Music.playing = true

func _on_Start_pressed():
	$ButtonPress.playing = true
	get_tree().change_scene("src/CutScene2.tscn")
	pass # replace with function body


func _on_Help_pressed():
	$ButtonPress.playing = true
	get_tree().change_scene("src/HelpScreen.tscn")
	
func _on_End_pressed():
	$ButtonPress.playing = true
	get_tree().quit()
