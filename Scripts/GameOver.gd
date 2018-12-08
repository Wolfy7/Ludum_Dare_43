extends CanvasLayer


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_RetryButton_pressed():
	get_tree().change_scene(Global.current_level)

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/LevelMenu.tscn")
