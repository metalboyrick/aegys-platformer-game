extends Node

signal _health_change()

func _on_Player__health_change():
	emit_signal("_health_change")
