extends Node2D


#futuramente implementar rand de inimigos
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
