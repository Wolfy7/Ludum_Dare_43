extends KinematicBody2D

var can_eat = true

func _process(delta):
	if $RayCast2D.is_colliding() and can_eat:
		can_eat = false
		var collider = $RayCast2D.get_collider()
		if collider.has_method("destroy"):
			collider.destroy()
		$Sprite.play("Eat")
		$Timer.start()

func destroy():
	queue_free()

func _on_Sprite_animation_finished():
	$Sprite.animation = "Idle"


func _on_Timer_timeout():
	can_eat = true
