extends Control

var weapon;
var weaponPicked:bool = false
@onready var jogarButton = $VBoxContainer/Jogar

func _process(_delta: float) -> void:
	if !weaponPicked:
		jogarButton.disabled = true;
	else:
		jogarButton.disabled = false;

func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn");

func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title.tscn");

func _on_pistol_toggled(toggled_on: bool) -> void:
	if toggled_on:
		weaponPicked = true;
		GlobalScript.setWeapon("pistol");

func _on_shotgun_toggled(toggled_on: bool) -> void:
	if toggled_on:
		weaponPicked = true;
		GlobalScript.setWeapon("shotgun");

func _on_chaingun_toggled(toggled_on: bool) -> void:
	if toggled_on:
		weaponPicked = true;
		GlobalScript.setWeapon("chaingun");
