extends AnimatedSprite


func _on_Explosion_animation_finished():
	queue_free()

func _on_Area2D_body_entered(body):
	print(body)
	if body.has_method("destroy"):
		body.destroy()