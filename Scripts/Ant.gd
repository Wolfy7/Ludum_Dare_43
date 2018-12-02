extends KinematicBody2D

export var speed = 100

const GRAVITY = 200
const UP = Vector2(0, -1)

var velocity = Vector2()
var move_direction = Vector2(1,0)


func _ready():
	$Timer.start()
	

func _process(delta):
	#var time_left = $Timer.time_left
	#if time_left <= 2:
	#	$Label.add_color_override("font_color", Color(1,0,0))
	$Label.text = str($Timer.time_left).pad_decimals(0)

func _physics_process(delta):
	if is_on_floor():
		velocity.y = 0
	if is_on_wall():
		toogle_move_direction()
	velocity.y += delta * GRAVITY
	velocity.x = speed * move_direction.x
	move_and_slide(velocity, UP)
	
func toogle_move_direction():
	move_direction.x *= -1
	$Sprite.flip_h = !$Sprite.flip_h 

func _on_Timer_timeout():
	# EXPLOSION
	var explosion = load("res://Environment/Explosion.tscn").instance()
	get_parent().add_child(explosion)
	explosion.position = self.position
	explosion.playing = true
	queue_free()
	#pass
