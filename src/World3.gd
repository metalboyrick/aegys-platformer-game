extends Node


func _ready():
	$bgm.playing = true
	$boss.playing = false

func _on_BossGate_to_boss():
	$bgm.playing = false
	$boss.playing = true


func _on_Boss_endgame():
	get_tree().change_scene("src/End.tscn")
	
func _on_Pause_paused():
	get_tree().paused = true
	pass # replace with function body

func _on_Pause_resume():
	get_tree().paused = false
	pass # replace with function body
	
func _on_Pause_restart():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_Pause_mainmenu():
	get_tree().paused = false
	get_tree().change_scene("src/Title.tscn")

