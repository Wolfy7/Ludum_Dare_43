extends CanvasLayer

func _ready():
	level_manger.create_default_file()
	level_manger.load_level_infos()
	
	for level_info in level_manger.level_infos.values():
		var new_button = load("res://Scenes/LevelButton.tscn").instance()
		new_button.level_info = level_info		
		$CenterContainer/GridContainer.add_child(new_button)
		
func show_level_name(level_name):
	$CenterContainer/LevelName.visible = true
	$CenterContainer/LevelName.text = level_name
	
func hide_level_name():
	$CenterContainer/LevelName.visible = false