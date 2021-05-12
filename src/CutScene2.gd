extends Node

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_select"):
		$ButtonPress.playing = true	
		get_tree().change_scene("src/World1.tscn")
	
