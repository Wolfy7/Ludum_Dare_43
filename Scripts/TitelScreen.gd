extends Node2D

func _ready():
	level_manger.load_level_infos()

func _on_StartButton_pressed():
	#get_tree().change_scene("res://Levels/0_Tutorial.tscn")
	get_tree().change_scene("res://Scenes/LevelMenu.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
