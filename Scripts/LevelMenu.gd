extends CanvasLayer

var levels = {}

func _ready():
	levels = file_grabber.get_files("res://Levels/")
	
	for level in levels.values():
		var new_button = load("res://Scenes/LevelButton.tscn").instance()
		new_button.level_scene = level
		$CenterContainer/GridContainer.add_child(new_button)
		
func show_level_name(level_name):
	$CenterContainer/LevelName.visible = true
	$CenterContainer/LevelName.text = level_name
	
func hide_level_name():
	$CenterContainer/LevelName.visible = false