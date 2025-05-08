extends Area2D

signal gameOverScreen;

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.getHurt();

func death():
	Engine.time_scale = 0.5;
	$Timer.start();

func _on_timer_timeout():
	Engine.time_scale = 1.0;
	get_tree().change_scene_to_file("res://scenes/Menus/game_over_screen.tscn");
	
