extends CanvasLayer


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_RetryButton_pressed():
	get_tree().change_scene("res://Levels/TestLevel.tscn")