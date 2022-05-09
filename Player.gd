extends KinematicBody2D
onready var sprite = get_node("AnimatedSprite")
onready var shieldSprite = get_node("ShieldSprite")
onready var speedSprite = get_node("SpeedSprite")

onready var powerupSpeedTimer = get_node("PowerUpSpeedTimer")
onready var powerupSizeTimer = get_node("PowerUpSizeTimer")

var velocity = Vector2()
var speed = 75

var shield = 0

func _ready():
	velocity.x = 0
	shieldSprite.visible = false
	speedSprite.visible = false

func _physics_process(delta):
	#velocity.y = gravityscale
	get_input()
	var motion = velocity*delta
	move_and_collide(motion)
	
func get_input():
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
	else:
		velocity.x = 0
		
func handle_hit():
	if shield <= 0:
		sprite.play('exploding')
		yield(sprite, "animation_finished")
		get_tree().reload_current_scene()
	elif shield >= 0:
		shield -= 1
		if shield == 0:
			shieldSprite.visible = false

func power_up(type):
	match type:
		'shield':
			print_debug("power up shield")
			shield = 3
			shieldSprite.visible = true
		'speed':
			print_debug("power up speed")
			speed = 150
			powerupSpeedTimer.start()
			speedSprite.visible = true
		'size':
			print_debug("power up size")
			scale.x = 0.5
			scale.y = 0.5
			powerupSizeTimer.start()
		_:
			print_debug("unkown powerup")


func _on_PowerUpSpeedTimer_timeout():
	speed = 75
	speedSprite.visible = false


func _on_PowerUpSizeTimer_timeout():
		scale.x = 1
		scale.y = 1
