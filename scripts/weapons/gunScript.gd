extends Node2D

var mousePos
@onready var weaponSlot = $"..";
@onready var weaponSprite = $Sprite2D;
var bullet = preload("res://scenes/bullet.tscn");
@onready var muzzle = $"../muzzle";

#var de shotgun
var pellets = 3;

#var para serem modificadas
var chosenWeapon;
var damage = 1;
var cooldown;


#TODO procurar um jeito melhor de fazer isso
var canFire = false;

func _on_player_set_chosen_weapon(weapon) -> void:
	if weapon == null:
		chosenWeapon = "pistol"
	else:
		chosenWeapon = weapon;
	
	loadWeaponSprites();

func loadWeaponSprites():
	match chosenWeapon:
		"pistol":
			weaponSprite.texture = load("res://assets/armas/pistola.png");
		"shotgun":
			weaponSprite.texture = load("res://assets/placeholder/shotgun_placeHolder.png");
			weaponSprite.flip_h = false;
			weaponSprite.scale = Vector2(1, 1);
		"chaingun":
			weaponSprite.texture = load("res://assets/placeholder/machineGun_placeHolder.png");
			weaponSprite.flip_h = false;
			weaponSprite.scale = Vector2(1, 1);


func _process(_delta):
	#pega as coordenadas do mouse na tela
	mousePos = get_global_mouse_position();
	weaponSlot.look_at(mousePos);
	
	#inverte o sprite da arma quando gira em 180 graus
	#faz a arma só girar até 360 graus
	var weaponRotation = wrap(weaponSlot.rotation_degrees, 0, 360);
	if weaponRotation > 90 and weaponRotation < 270:
		weaponSprite.flip_v = true;
	else:
		weaponSprite.flip_v = false;
		
	#lida com a logica da bala
	if Input.is_action_pressed("shoot") and canFire:
		match chosenWeapon:
			"pistol":
				pistolLogic();
			"shotgun":
				shotgunLogic();
			"chaingun":
				chaingunLogic();
		#Achar um jeito melhor de fazer isso
		canFire = false
		
func _on_fire_rate_timeout():
	canFire = true


func _on_player_set_damage(dmg) -> void:
	damage = dmg;

func pistolLogic():
	#instancia a cena bullet
	var bulletInstance = bullet.instantiate();
	bulletInstance.setDamage(damage)
	#instancia bala no mundo para ela não mudar sua posição depois de atirada
	get_tree().root.add_child(bulletInstance);
	#faz a bala sair do ponto marcado na arma
	bulletInstance.global_position = global_position;
	bulletInstance.rotation = global_rotation;

func _on_player_set_pellets(quantity) -> void:
	pellets = quantity;

func shotgunLogic():
	var arc = 30.0;
	damage = 3
	%fireRate.set_wait_time(1.0);
	
	for i in pellets:
		var bulletInstance = bullet.instantiate();
		bulletInstance.setDamage(damage)
		get_tree().root.add_child(bulletInstance);
		bulletInstance.global_position = global_position;
		
		#lógica de spread de balas
		var arc_rad = deg_to_rad(arc);
		var increment = arc_rad / (pellets - 1)
		bulletInstance.rotation = (
			global_rotation + increment * i - arc_rad / 2
		);

func chaingunLogic():
	%fireRate.set_wait_time(0.1);
	
	var bulletInstance = bullet.instantiate();
	bulletInstance.setDamage(damage)
	get_tree().root.add_child(bulletInstance);
	bulletInstance.global_position = global_position;
	bulletInstance.rotation = global_rotation;
	
