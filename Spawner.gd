extends Node2D

var loadAsteroid = preload("res://Asteroid.tscn")
onready var timer = get_node("Timer")

var score = 0

func _ready():
	timer.start()
	spawn_asteroid(1)

func spawn_asteroid(spawnrate):
	for a in range(spawnrate):
		var asteroid = loadAsteroid.instance()
		add_child(asteroid)

func _on_Timer_timeout():
	spawn_asteroid(1)
	timer.start()
