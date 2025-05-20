extends Control

@onready var sprite: Sprite2D = $Sprite2D
@onready var speech_bubble: TextureRect = $speech_bubble
@onready var game_over: Label = $GameOver



func _ready() -> void:
	Soundtrack.playMusic("mainMenu");
	animateTitle();

func animateTitle():
	var titleAnimation = game_over.create_tween();
	titleAnimation.tween_property(game_over,"position",Vector2(240,80.0),0.4).set_trans(titleAnimation.TRANS_EXPO).set_ease(titleAnimation.EASE_IN_OUT);
	titleAnimation.play();

func _process(delta: float) -> void:
	if sprite.global_position.x < 192.0:
		sprite.global_position.x += 850.0 * delta;
		
	if sprite.global_position.x >= 192.0:
		speech_bubble.visible = true;
		

func animation():
	pass

func _on_respawn_pressed() -> void:
	Soundtrack.playEffect("accept");
	get_tree().change_scene_to_file("res://scenes/Menus/selection_menu.tscn");

func _on_menu_principal_pressed() -> void:
	Soundtrack.playEffect("denied");
	get_tree().change_scene_to_file("res://scenes/title.tscn");
