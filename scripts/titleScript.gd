extends Node2D

func _ready() -> void:
	Soundtrack.playMusic("mainMenu");



func _on_jogar_pressed():
	Soundtrack.playEffect("accept");
	get_tree().change_scene_to_file("res://scenes/Menus/selection_menu.tscn");

func _on_config_pressed():
	Soundtrack.playEffect("accept");
	get_tree().change_scene_to_file("res://scenes/Menus/options.tscn");

func _on_sair_pressed():
	Soundtrack.playEffect("denied")
	get_tree().quit();
