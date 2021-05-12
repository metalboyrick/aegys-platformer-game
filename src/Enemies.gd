extends Node

signal killed()
signal kill_player()

func _on_Enemy_killed():
	emit_signal("killed")



func _on_Enemy_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy10_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy2_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy3_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy11_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy4_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy6_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy7_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy5_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy8_kill_player():
	emit_signal("kill_player")
	pass # replace with function body


func _on_Enemy9_kill_player():
	emit_signal("kill_player")
	pass # replace with function body
