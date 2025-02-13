extends CharacterBody2D


const SPEED = -200.0;
const ACCEL = 4;

#vetor que recebe valores de x e y
var input: Vector2;

#resolve o problema de diagonal ser mais rápida
func getInput():
	input.x = Input.get_action_strength("left") - Input.get_action_strength("right");
	input.y = Input.get_action_strength("up") - Input.get_action_strength("down");
	return input.normalized();

func _physics_process(delta):
	var direction = getInput();
	
	#lerp = interpolação linear, ele recebe argumentos de valor min/max e o quão suave é a transição entre valores
	velocity = getInput() * SPEED
	
	move_and_slide();
