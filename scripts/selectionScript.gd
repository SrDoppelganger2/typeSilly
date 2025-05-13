extends Control

var weapon;
var weaponPicked:bool = false
@onready var jogarButton = %Jogar;
@onready var melancio = $melancio;
@onready var janela = $janela;

func _ready() -> void:
	melancioAnimation();
	janelaAnimation();

func _process(_delta: float) -> void:
	if !weaponPicked:
		jogarButton.disabled = true;
	else:
		jogarButton.disabled = false;

func melancioAnimation():
	var panelAnimation = melancio.create_tween();
	panelAnimation.tween_property(melancio,"position",Vector2(-68,138),0.4).set_trans(panelAnimation.TRANS_EXPO).set_ease(panelAnimation.EASE_IN_OUT);
	panelAnimation.play();

func janelaAnimation():
	var panelAnimation = janela.create_tween();
	panelAnimation.tween_property(janela,"position",Vector2(520,90),0.4).set_trans(panelAnimation.TRANS_EXPO).set_ease(panelAnimation.EASE_IN_OUT);
	panelAnimation.play();

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
