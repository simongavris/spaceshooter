extends Area2D

var velocity = Vector2()
var speed = 1

onready var sprite = get_node("Sprite")
onready var colShape = get_node("CollisionShape2D")
var rng = RandomNumberGenerator.new()


var rotation_speed_rad : float = 0

func _ready():
	rng.randomize()
	
	var random_x = rng.randi_range(0+5, 128-5)
	position = Vector2(random_x, 0)
		
	rotation_speed_rad = rng.randf_range(-0.2, .2)
	
	speed = rng.randf_range(0.5, 2)

func _physics_process(delta):
	#velocity.y = gravityscale
	velocity.y = speed
	global_position += velocity
	self.rotate(rotation_speed_rad)


func _on_Asteroid_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()


func _on_Asteroid_area_exited(area):
	if area.has_method("count_exit"):
		area.count_exit(1)
		hide()
		queue_free()
