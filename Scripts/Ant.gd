extends KinematicBody2D

export var speed = 50

const GRAVITY = 10
const UP = Vector2(0, -1)

var velocity = Vector2(1, 0)


func _physics_process(delta):
	if is_on_floor():
		velocity.y = 0
	velocity.y += delta * GRAVITY
	move_and_slide(velocity * speed, UP)