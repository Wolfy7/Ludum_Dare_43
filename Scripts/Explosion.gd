extends AnimatedSprite


func _on_Explosion_animation_finished():
	print("fertig")
	queue_free()