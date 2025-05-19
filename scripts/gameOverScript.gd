extends Control

func _ready() -> void:
	Soundtrack.playMusic("mainMenu");

func _on_respawn_pressed() -> void:
	Soundtrack.playEffect("accept");
	get_tree().change_scene_to_file("res://scenes/Menus/selection_menu.tscn");

func _on_menu_principal_pressed() -> void:
	Soundtrack.playEffect("denied");
	get_tree().change_scene_to_file("res://scenes/title.tscn");
