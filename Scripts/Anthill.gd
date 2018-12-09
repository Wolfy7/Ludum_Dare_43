extends Area2D

var ants_saved = 0
var ants_to_save = 0

func _ready():
	$AnimatedSprite.animation = "open"

func set_ants_to_save(ants):
	ants_to_save = ants
	$Label.text = str(ants_to_save)
	

func _on_Anthill_body_entered(body):
	ants_saved += 1
	$Label.text = str(ants_to_save - ants_saved)
	body.queue_free()
	get_tree().call_group("level", "ant_saved")
	if ants_saved >= ants_to_save:
		$CollisionShape2D.disabled = true
		$AnimatedSprite.play("close_anim")


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.animation = "closed"
