extends KinematicBody2D

func _process(delta):
	if $RayCast2D.is_colliding():
		var collider = $RayCast2D.get_collider()
		if collider.has_method("destroy"):
			collider.destroy()
		$Sprite.play("Eat")

func destroy():
	queue_free()

func _on_Sprite_animation_finished():
	$Sprite.animation = "Idle"
