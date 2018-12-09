extends Node2D

var ants_to_spawn = 0
var spawned_ants = 0

func set_ants_to_spanw(ants):
	ants_to_spawn = ants
	$Label.text = str(ants_to_spawn - spawned_ants)

func _on_Timer_timeout():
	var ant = load("res://Characters/Ant.tscn").instance()
	ant.position = $Position2D.position
	add_child(ant)
	spawned_ants += 1
	$Label.text = str(ants_to_spawn - spawned_ants)
	if spawned_ants >= ants_to_spawn:
		$Timer.queue_free()