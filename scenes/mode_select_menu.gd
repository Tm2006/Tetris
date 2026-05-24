extends Control

func _ready():
	# Ставим фокус на первую кнопку для управления с клавиатуры
	$VBoxContainer/ClassicButton.grab_focus()

func _on_classic_button_pressed():
	# Запускаем нашу рабочую основную игру (Classic)
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_arcade_button_pressed():
	# Пока ничего не делает, либо можете прописать путь к будущей сцене
	print("Arcade mode is not ready yet!")

func _on_back_button_pressed():
	# Возвращаемся в Главное меню
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
