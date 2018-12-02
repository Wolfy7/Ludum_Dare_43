extends KinematicBody2D

export var speed = 100

const GRAVITY = 200
const UP = Vector2(0, -1)

var velocity = Vector2()
var move_direction = Vector2(1,0)
var is_selectable = true


func _ready():
	#$Timer.start()
	pass
	

func _process(delta):
	#var time_left = $Timer.time_left
	#if time_left <= 2:
	#	$Label.add_color_override("font_color", Color(1,0,0))
	if not $Timer.is_stopped():
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
#	var cshape = CircleShape2D.new()
#	cshape.set_radius(20.0)
#	collision_layer = 16
#	collision_mask = 12
#	$CollisionShape2D.shape = cshape
#	set_physics_process(false)
	
	var explosion = load("res://Environment/Explosion.tscn").instance()
	get_parent().add_child(explosion)
	explosion.position = self.position
	explosion.playing = true
	queue_free()
	#pass

func _on_Ant_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and is_selectable:
			$AnimatedSprite.visible = true
			$AnimatedSprite.playing = true
			$AntPopup.popup_centered()

func _on_AntPopup_popup_hide():
		$AnimatedSprite.visible = false
		$AnimatedSprite.playing = false

func _on_Button_pressed():
	pass # Replace with function body.


func _on_Button2_pressed():
	$AnimationPlayer.play("prepare_exploded")
	$Timer.start()
	$AntPopup.hide()
	is_selectable = false
	
	
func destroy():
	queue_free()