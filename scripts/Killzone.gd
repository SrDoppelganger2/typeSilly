extends Area2D

#jeito porco de concertar o bug
var timerStarted = false;
signal pushEnemy;

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.getHurt();
		pushEnemy.emit();

func death():
	Engine.time_scale = 0.5;
	if !timerStarted:
		$Timer.start();
		timerStarted = true;

func _on_timer_timeout():
	Engine.time_scale = 1.0;
	timerStarted = false;
	get_tree().change_scene_to_file("res://scenes/Menus/game_over_screen.tscn");
	
