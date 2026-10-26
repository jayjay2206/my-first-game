
extends Node

func _ready():
	add_to_group("game_manager")
	get_tree().paused = false

	var screen = get_parent().get_node_or_null("GameOverScreen")

	if screen:
		screen.hide()
		screen.process_mode = Node.PROCESS_MODE_ALWAYS

		var button = screen.get_node_or_null("Background/RestartButton")
		if button:
			button.pressed.connect(restart_game)
		else:
			print("RestartButton not found!")
	else:
		print("GameOverScreen not found!")

func game_over():
	var screen = get_parent().get_node_or_null("GameOverScreen")

	if screen:
		screen.show()
		get_tree().paused = true

func restart_game():
	get_tree().paused = false
	get_tree().reload_current_scene()
