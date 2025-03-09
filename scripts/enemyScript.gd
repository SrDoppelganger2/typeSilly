extends CharacterBody2D

@onready var player = get_node("/root/mainScene/player");
@onready var stats = $EnemyStats

const SPEED = 75.0;
var health = 1;

var direction;

func getPlayerPosition():
	return player.position - position

func takeDamage():
	health -= 1;
	
	if health <= 0:
		queue_free();

func _physics_process(delta):
	var direction = getPlayerPosition();
	velocity = direction * SPEED * delta;
	
	move_and_slide();
	
