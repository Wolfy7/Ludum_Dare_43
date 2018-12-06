extends CanvasLayer

func _on_NextLevelButton_pressed():
	get_tree().change_scene("res://Levels/0_Tutorial.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
