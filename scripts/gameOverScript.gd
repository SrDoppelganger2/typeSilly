extends Control


func _on_respawn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn");

func _on_menu_principal_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title.tscn");
