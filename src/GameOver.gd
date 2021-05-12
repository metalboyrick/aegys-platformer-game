extends Control


func _ready():
	set("visible", false)

func _on_TextureButton_pressed():
	get_tree().change_scene("src/Title.tscn")


func _on_Player__is_dead():
	set("visible", true)
	pass # replace with function body

