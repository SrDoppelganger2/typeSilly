extends Control


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Menus/options.tscn");
