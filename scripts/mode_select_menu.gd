extends Control

@onready var high_score_label = $HighScoreLabel # Укажите ваш правильный путь!

func _ready():
	Shared.load_high_score() 
	
	high_score_label.text = "High Score: " + str(Shared.high_score)

func _on_classic_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_arcade_button_pressed() -> void:
	print("coming soon:D")
	

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
