extends Node2D

func _on_Timer_timeout():
	var ant = load("res://Characters/Ant.tscn").instance()
	ant.position = $Position2D.position
	add_child(ant)
