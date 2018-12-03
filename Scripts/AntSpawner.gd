extends Node2D

export var ants = 9
var spawned_ants = 0

func _on_Timer_timeout():
	$Label.text = str(ants - spawned_ants)
	if spawned_ants >= ants:
		$Timer.queue_free()
	var ant = load("res://Characters/Ant.tscn").instance()
	ant.position = $Position2D.position
	add_child(ant)
	spawned_ants += 1