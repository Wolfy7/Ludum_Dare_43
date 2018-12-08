extends Area2D

var ants_saved = 0
var ants_to_save = 0

signal all_ants_saved

func _ready():
	connect("all_ants_saved", get_parent(), "level_finished")

func set_ants_to_save(ants):
	ants_to_save = ants
	$Label.text = str(ants_to_save)
	

func _on_Anthill_body_entered(body):
	ants_saved += 1
	$Label.text = str(ants_to_save - ants_saved)
	body.queue_free()
	if ants_saved >= ants_to_save:
		emit_signal("all_ants_saved")
