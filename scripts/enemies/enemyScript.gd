extends CharacterBody2D

@onready var player = get_node("/root/mainScene/player");
@onready var exp_base = get_tree().get_first_node_in_group("coletavel");
@onready var exp_orb = preload("res://scenes/xp.tscn");
@onready var sprites = $Sprite2D;

var direction;
var type;


#atributos que podem mudar para cada tipo de inimigo
@export var speed = 75.0;
@export var health = 1;
@export var exp = 1;
@onready var hitbox = $hitbox
@onready var hurtbox = $Killzone/killzoneCollision
@onready var flash = $flash

func _ready() -> void:
	if type == "nectafiro":
		nectafiro();
	elif type == "ligeirinho":
		ligeirinho();
	elif type == "poligonhom":
		poligonhom();
	else:
		#deixa o nectafiro como default
		nectafiro();

func getPlayerPosition():
	return player.position - position

func takeDamage(damage):
	health -= damage;
	flash.play("hitFlash");
	if health <= 0:
		death();

func setType(newType):
	type = newType;

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
	
	#vira o sprite do inimigo para a direção geral do jogador
	if player.position > global_position:
		sprites.scale.x = -1
	else:
		sprites.scale.x = 1
	
	move_and_slide();

#faz com que o inimigo não fique colado no jogador
func _on_killzone_push_enemy() -> void:
	global_position -= direction;

func nectafiro():
	sprites.play("nectafiro")
	speed = 75.0;
	health = 3;
	exp = 1;

func ligeirinho():
	sprites.play("ligeirinho")
	speed = 120.0;
	health = 2;
	exp = 2;
	
	#ajusta a hitbox
	hitbox.scale = Vector2(1.2,1.6)
	hitbox.position.x += 5
	
	#ajusta a hurtbox
	hurtbox.scale = Vector2(1.2,1.6)
	hurtbox.position.x += 5


func poligonhom():
	sprites.play("poligonhom")
	speed = 50.0;
	health = 8;
	exp = 1;
	
	#ajusta a hitbox
	hitbox.scale = Vector2(1.6,1.6)
	hitbox.position.x += 3
	
	#ajusta a hurtbox
	hurtbox.scale = Vector2(1.7,1.7)
	hurtbox.position.x += 1
