extends AnimatedSprite

var type

func _ready():
	animation = type
	playing = true
	if type == "biohazard":
		offset.y = -20
		$AudioStreamPlayer2D.stream = load("res://SFX/biohazard.wav")
	elif type == "explosion":
		offset.y = 2
		$AudioStreamPlayer2D.stream = load("res://SFX/explosion2.wav")
	

func _on_Explosion_animation_finished():
	queue_free()

func _on_Area2D_body_entered(body):
	
	if type == "biohazard":
		if body.has_method("hit_by_biohazard"):
			body.hit_by_biohazard()
	elif type == "explosion":
		if body.has_method("hit_by_explosion"):
			body.hit_by_explosion()
