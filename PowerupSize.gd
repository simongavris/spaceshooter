extends Area2D

var velocity = Vector2()
var speed = 1

onready var colShape = get_node("CollisionShape2D")
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
	var random_x = rng.randi_range(0+5, 128-5)
	position = Vector2(random_x, 0)
	
	speed = 1

func _physics_process(delta):
	velocity.y = speed
	global_position += velocity

func _on_PowerupSpeed_body_entered(body):
	if body.has_method("power_up"):
		body.power_up('size')
		hide()
		queue_free()
