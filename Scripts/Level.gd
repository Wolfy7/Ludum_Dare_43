extends Node2D

export var level_time = 10
export var ants = 30
export var ants_to_save_percent = 0.4
export var id = 0

func _ready():
	Global.ants = ants
	Global.ants_to_save = ants * ants_to_save_percent
	$AntSpawner.ants = ants
	$Anthill.set_ants_to_save(Global.ants_to_save)
	$Timer.wait_time = level_time
	$Timer.start()

func _process(delta):
	update_time_left()
	#print(Global.ants, Global.ants_alive, Global.ants_to_save)
	if Global.ants < Global.ants_to_save:
		gameover()

func update_time_left():
	$GUI.update_time_left($Timer.time_left)

func _on_Timer_timeout():
	gameover()
	
func gameover():
	get_tree().change_scene("res://Scenes/GameOver.tscn")