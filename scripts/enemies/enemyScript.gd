extends CharacterBody2D

@onready var player = get_node("/root/mainScene/player");
@onready var exp_base = get_tree().get_first_node_in_group("coletavel");

var direction;

#atributos que podem mudar para cada tipo de inimigo
@export var speed = 75.0;
@export var health = 1;
@export var exp = 1;
@onready var exp_orb = preload("res://scenes/xp.tscn");
@onready var flash = $flash

func getPlayerPosition():
	return player.position - position

func takeDamage(damage):
	health -= damage;
	flash.play("hitFlash");
	if health <= 0:
		death();

func death():
	
	#dropa exp
	var exp_drop = exp_orb.instantiate();
	exp_drop.global_position = global_position;
	exp_drop.value = exp;
	exp_base.call_deferred("add_child", exp_drop);
	
	queue_free();
	

func _physics_process(delta):
	direction = getPlayerPosition();
	velocity = direction * speed * delta;
	
	move_and_slide();
	
