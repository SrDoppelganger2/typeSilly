extends Node2D



func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn");


func _on_sair_pressed():
	get_tree().quit();
