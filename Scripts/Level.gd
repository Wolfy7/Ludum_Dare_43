extends Node2D

export var level_time = 10
export var ants = 30
export var ants_to_save_percent = 0.4
export var id = 0

var ants_to_save = int(ants * ants_to_save_percent)
var ants_saved = 0

func _ready():
	Engine.time_scale = 1.0
	$AntSpawner.set_ants_to_spanw(ants)
	
	var hills = $Anthills.get_child_count()
	for hill in $Anthills.get_children():
		hill.set_ants_to_save(ants_to_save/hills)
		
	$Timer.wait_time = level_time
	$Timer.start()
	Global.current_level = get_tree().current_scene.filename
	
func _process(delta):
	update_time_left()
	if ants < ants_to_save:
		gameover()

func update_time_left():
	$GUI.update_time_left($Timer.time_left)

func _on_Timer_timeout():
	gameover()
	
func gameover():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	
func level_finished():
	print("Gewonnen")
	level_manger.unlock_next_level(id)
	get_tree().change_scene("res://Scenes/LevelComplete.tscn")

func ant_destroyed():
	ants -= 1
	
func ant_saved():
	ants_saved += 1
	if ants_saved >= ants_to_save:
		level_finished()





