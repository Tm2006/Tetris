extends Control

func _ready():
	$MenuContainer/StartButton.grab_focus()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mode_select_menu.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
