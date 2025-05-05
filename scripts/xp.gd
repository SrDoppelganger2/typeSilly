extends Area2D

@export var exp = 1;

var target = null;
var speed = 0;
var sprite = preload("res://assets/placeholder/xp.png");

@onready var sprite2D = $Sprite2D;
@onready var collision: CollisionShape2D = $CollisionShape2D

func _physics_process(delta: float):
	if target != null:
		# faz o xp se mover em direção ao jogador
		global_position = global_position.move_toward(target.global_position, speed);
		speed += 4 * delta;

func collected():
	#fazer da seguinte forma qquando adicionar so de coleta:
	#collision.call_deferred("set","disabled");
	#sprite.visible = false;
	#queue free qnd o som parar de tocar
	queue_free();
	return exp;
