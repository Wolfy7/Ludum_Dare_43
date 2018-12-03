extends CanvasLayer

func _on_NextLevelButton_pressed():
	get_tree().change_scene("res://Levels/TestLevel.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
