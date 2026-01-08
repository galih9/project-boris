extends Control

func _ready():
	visible = false

func resume():
	get_tree().paused = false
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func pause():
	visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_resume_pressed():
	resume()

func _on_quit_pressed():
	get_tree().quit()

func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		if visible:
			resume()
		else:
			pause()
