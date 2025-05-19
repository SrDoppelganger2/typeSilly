extends Node2D

@onready var pause_menu: Control = $Menus/pauseMenu;
@onready var gameOverScreen: Control = $Menus/GameOverScreen;
var paused = false;

@onready var mobsNode = get_tree().get_first_node_in_group("inimigos");
@onready var player = get_tree().get_first_node_in_group("player");


func _ready() -> void:
	Soundtrack.playMusic("action");

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseGame();

func pauseGame():
	if paused:
		pause_menu.hide();
		get_tree().paused = false;
	else:
		pause_menu.show();
		get_tree().paused = true;
	
	paused = !paused;

func _on_pause_menu_retomar_jogo() -> void:
	paused = true;
	pauseGame();
	
func _on_pause_menu_sair_jogo() -> void:
	paused = true;
	pauseGame();
	get_tree().change_scene_to_file("res://scenes/title.tscn");

#futuramente implementar rand de inimigos
#func de spawnar inimigos
func mobSpawner():
	#define que os inimigos vão spawnar no path2D
	var spawnPosition = %PathFollow2D.global_position;
	#define qual inimigo será spawnado
	var enmType = randomizeEnemy();
	#Instancia inimigos
	var newMob = preload("res://scenes/enm.tscn").instantiate();
	newMob.setType(enmType);
	#randomiza posição no path2D
	%PathFollow2D.progress_ratio = randf();
	newMob.global_position = spawnPosition;
	#Adiciona mob no jogo
	mobsNode.call_deferred("add_child",newMob);
	
func _on_enm_spawnrate_timeout():
	mobSpawner();

func randomizeEnemy():
	var prob = randi_range(0, 100)
	
	if prob <= 50:
		return "nectafiro";
	elif prob > 50 and prob <= 80:
		return "ligeirinho";
	elif prob > 80:
		return "poligonhom"
	else:
		#para previnir erros, deixa o nectafiro como default 
		return "nectafiro"
		
#MEME
func _on_melan_timer_timeout() -> void:
	%Melan.hide();
