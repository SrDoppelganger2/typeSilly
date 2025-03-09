extends Node2D

var mousePos
@onready var weaponSlot = $"..";
@onready var weaponSprite = $Sprite2D;
@export var Bullet: PackedScene;
@onready var muzzle = $"../muzzle";

#TODO procurar um jeito melhor de fazer isso
var canFire = false;

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
		#instancia a cena bullet
		var bulletInstance = Bullet.instantiate();
		#instancia bala no mundo para ela não mudar sua posição depois de atirada
		get_tree().root.add_child(bulletInstance);
		#faz a bala sair do ponto marcado na arma
		bulletInstance.global_position = global_position;
		bulletInstance.rotation = global_rotation;
		
		#Achar um jeito melhor de fazer isso
		canFire = false
		
func _on_fire_rate_timeout():
	canFire = true
