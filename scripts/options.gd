extends Node2D


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/title.tscn");

#configurações de audio
func _on_masterVolume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db(value));
	
func _on_mutar_master_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)
	

func _on_musicVolume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1,linear_to_db(value));
	
func _on_mutar_musica_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(1,toggled_on);
