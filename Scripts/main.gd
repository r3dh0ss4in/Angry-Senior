extends Control


func _ready() -> void:
	%Play.pressed.connect(play)
	%Quit.pressed.connect(quit)

func play():
	get_tree().change_scene_to_file("res://Scenes/Level_1/level_1.tscn")

func quit():
	get_tree().quit()
