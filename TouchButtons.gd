extends Node2D


func _on_LeftButton_pressed():
	Input.action_press("ui_left")
	
func _on_LeftButton_released():
	Input.action_release("ui_left")

func _on_RightButton_pressed():
	Input.action_press("ui_right")

func _on_RightButton_released():
	Input.action_release("ui_right")
