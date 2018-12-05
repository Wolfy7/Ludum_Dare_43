extends KinematicBody2D

export var speed = 100

const GRAVITY = 200
const UP = Vector2(0, -1)

var velocity = Vector2()
var move_direction = Vector2(1,0)
var is_selectable = true
var command = ""

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
	if command == "die":
		$AnimationPlayer.play("die")
		return
		
	var explosion = load("res://Environment/Explosion.tscn").instance()
	explosion.position = self.position
	explosion.type = command
	get_parent().add_child(explosion)
	destroy_ant()

func _on_Ant_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and is_selectable:
			$AnimatedSprite.visible = true
			$AnimatedSprite.playing = true
			$AntPopup.popup()
			$AntPopup/AnimationPlayer.play("open")

func _on_AntPopup_popup_hide():
		$AnimatedSprite.visible = false
		$AnimatedSprite.playing = false

func _on_Button_pressed():
	command = "die"
	$AnimationPlayer.play("prepare_die")
	$Timer.wait_time = 1
	$Timer.start()
	$AntPopup.hide()
	is_selectable = false

func _on_Button2_pressed():
	command = "explosion"
	$AnimationPlayer.play("prepare_exploded")
	$Timer.wait_time = 5
	$Timer.start()
	$AntPopup.hide()
	is_selectable = false

func _on_Button3_pressed():
	command = "biohazard"
	$AnimationPlayer.play("prepare_biohazard")
	$Timer.wait_time = 4
	$Timer.start()
	$AntPopup.hide()
	is_selectable = false
	
func destroy():
	destroy_ant()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		var corpse = load("res://Environment/Corpse.tscn").instance()
		corpse.position = self.position + Vector2(0,6)
		get_parent().add_child(corpse)
		destroy_ant()
		
func destroy_ant():
	if Global.ants:
		Global.ants -= 1
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	destroy_ant()
