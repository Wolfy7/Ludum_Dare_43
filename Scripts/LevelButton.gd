extends TextureButton

var level_scene
var level_name
var level_id

func _enter_tree():
	var level_info = level_scene.get_file().get_basename().split('_')
	level_id = level_info[0]
	level_name = level_info[1]
	$Label.text = str(level_id)
	connect("mouse_entered", get_parent().get_parent().get_parent(), "show_level_name", [level_name])
	connect("mouse_exited", get_parent().get_parent().get_parent(), "hide_level_name")

func _on_LevelButton_pressed():
	get_tree().change_scene(level_scene)
