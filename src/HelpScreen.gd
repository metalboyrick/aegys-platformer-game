extends Control

func _ready():
	$bgm.playing = true

func _on_TextureButton_pressed():
	get_tree().change_scene("src/Title.tscn")