extends TextureButton

var level_info
var level_scene
var level_name
var level_id
var level_locked

func _enter_tree():
	level_id = level_info["level_id"]
	level_name = level_info["level_name"]
	level_scene = level_info["level_path"]
	level_locked = level_info["locked"]
	$Label.text = str(level_id)
	disabled = level_locked
	connect("mouse_entered", get_parent().get_parent().get_parent(), "show_level_name", [level_name])
	connect("mouse_exited", get_parent().get_parent().get_parent(), "hide_level_name")

func _on_LevelButton_pressed():
	get_tree().change_scene(level_scene)
