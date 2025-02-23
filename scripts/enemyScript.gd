extends CharacterBody2D

@onready var player = get_node("/root/mainScene/player");
const SPEED = 75.0;
var direction;

func getPlayerPosition():
	return player.position - position

func _physics_process(delta):
	var direction = getPlayerPosition();
	velocity = direction * SPEED * delta;
	
	move_and_slide();
	
