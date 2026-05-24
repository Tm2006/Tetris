extends Node

@onready var board = $Board
@onready var score_label = $UI/ScoreLabel
@onready var level_label = $UI/LevelLabel
@onready var lines_label = $UI/LinesLabel
@onready var game_over_screen = $UI/GameOverScreen if has_node("UI/GameOverScreen") else null

func _ready():
	# Update UI with initial values
	update_ui(0, 1, 0)
	# Connect the signal from the board
	board.score_updated.connect(update_ui)
	board.game_over.connect(on_game_over)
	
	if game_over_screen:
		game_over_screen.hide()

func update_ui(score: int, level: int, lines: int):
	score_label.text = "Score: " + str(score)
	level_label.text = "Level: " + str(level)
	lines_label.text = "Lines: " + str(lines)

	Shared.save_high_score(score)

func on_game_over():
	if game_over_screen:
		game_over_screen.show()
	else:
		print("Game Over! (UI Node not found)")

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/mode_select_menu.tscn")
