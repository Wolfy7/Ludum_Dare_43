extends Node2D

export var level_time = 10

func _ready():
	$Timer.wait_time = level_time
	$Timer.start()

func _process(delta):
	update_time_left()

func update_time_left():
	$GUI.update_time_left($Timer.time_left)

func _on_Timer_timeout():
	print("Game Over")
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	pass # Replace with function body.


func _on_Anthill_body_entered(body):
	print("Ant entered")
	body.queue_free()
