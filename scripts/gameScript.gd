extends Node2D

@onready var pause_menu: Control = $pauseMenu;
var paused = false;

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pass

func pauseGame():
	if paused:
		pause_menu.hide();
		Engine.time_scale = 1;
	else:
		pause_menu.show();
		Engine.time_scale = 0;

#futuramente implementar rand de inimigos
#func de spawnar inimigos
func mobSpawner():
	#define que os inimigos vão spawnar no path2D
	var spawnPosition = %PathFollow2D.global_position;
	#Instancia inimigos
	var newMob = preload("res://scenes/enm.tscn").instantiate();
	#randomiza posição no path2D
	%PathFollow2D.progress_ratio = randf();
	newMob.global_position = spawnPosition;
	#Adiciona mob no jogo
	add_child(newMob);
	
	
func _on_enm_spawnrate_timeout():
	mobSpawner();
	
