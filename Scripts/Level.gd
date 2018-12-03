extends Node2D

export var level_time = 10
var ants = 30
var ants_to_save = ants * 0.4

func _ready():
	Global.ants_alive = ants
	$AntSpawner.ants = ants
	$Anthill.set_ants_to_save(ants_to_save)
	$Timer.wait_time = level_time
	$Timer.start()

func _process(delta):
	update_time_left()
	if Global.ants_alive < ants_to_save:
		gameover()

func update_time_left():
	$GUI.update_time_left($Timer.time_left)

func _on_Timer_timeout():
	gameover()
	
func gameover():
	get_tree().change_scene("res://Scenes/GameOver.tscn")