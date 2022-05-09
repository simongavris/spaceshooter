extends Label
onready var game = get_parent()

func _process(delta):
	text = "Level: " + str(game.global_level)
