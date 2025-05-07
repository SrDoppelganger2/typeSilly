extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.getHurt();

func death():
	Engine.time_scale = 0.5;
	$Timer.start();

func _on_timer_timeout():
	get_tree().reload_current_scene()
	Engine.time_scale = 1.0;
