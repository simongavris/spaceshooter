extends Label
onready var game = get_parent()

func _process(delta):
	text = str(game.global_score)
