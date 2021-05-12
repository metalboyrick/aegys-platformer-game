extends Node

signal _count_change() 
signal stage_clear()

func _on_Enemies_killed():
	emit_signal("_count_change") 


func _on_Kill__clear():
	emit_signal("stage_clear")
	pass # replace with function body
