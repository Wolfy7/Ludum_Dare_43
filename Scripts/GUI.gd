extends CanvasLayer

func update_time_left(time):
	$TimeLeft.text = str(time).pad_decimals(0)
	
func _unhandled_key_input(event):
	if event.pressed and event.scancode == KEY_R:
		restart_level()

func _on_ReloadButton_pressed():
	restart_level()

func _on_BckButton_pressed():
	get_tree().change_scene("res://Scenes/LevelMenu.tscn")
	
func restart_level():
	get_tree().reload_current_scene()
