extends Node

onready var file = File.new()
onready var file_path = "res://levels.json" #TODO: change to user://

var level_infos = {}
var levels = {}

func load_level_infos():
	if not file.file_exists(file_path):
		create_default_file()
	
	file.open(file_path, File.READ)
	var data = file.get_as_text()
	level_infos = parse_json(data)
	file.close()

func save_level_infos():
	print(file.open(file_path, File.WRITE) )
	file.store_line(to_json(level_infos))
	file.close()
	
func create_default_file():	
	levels = file_grabber.get_files("res://Levels/")
	
	for level in levels.values():
		var infos = {}
		var level_info = level.get_file().get_basename().split('_')
		var level_id = int(level_info[0])
		var level_name = level_info[1]
		
		infos["level_name"] = level_name
		infos["level_id"] = level_id
		infos["level_path"] = level
		infos["locked"] = true if (level_id != 0) else false		
		
		level_infos[level_id] = infos
		save_level_infos()

func unlock_next_level(current_level):
	var next_level = str(current_level + 1)
	if level_infos.has(next_level):
		level_infos[next_level].locked = false
		save_level_infos()
	else:
		#TODO: last level finished
		pass
	










