extends CharacterBody2D

@onready var sprite = $Sprite2D

const SPEED = -200.0;
const ACCEL = 4;
#TODO modularizar esses stats para facilitar upgrades (talvez não seja necessário)
var health = 5;
#vetor que recebe valores de x e y
var input: Vector2;

#var de experiência e de nível
var exp = 0
var exp_level = 1
var collected_exp = 0

func _ready():
	sprite.play("default");

#resolve o problema de diagonal ser mais rápida
func getInput():
	input.x = Input.get_action_strength("left") - Input.get_action_strength("right");
	input.y = Input.get_action_strength("up") - Input.get_action_strength("down");
	return input.normalized();

func getHurt():
	health -= 1;
	%PlayerHealthBar.value = health
	sprite.play("hurt");
	#TODO adicionar animação de morte e tela de gameover para chamar aqui
	if health <= 0:
		Killzone.death();

func _physics_process(delta):
	var direction = getInput();
	velocity = getInput() * SPEED
	
	move_and_slide();

func _on_sprite_2d_animation_finished():
	sprite.play("default");

#lógica de níveis e exp
func _on_grab_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("coletavel"):
		area.target = self;

func _on_collect_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("coletavel"):
		var exp_orb = area.collected();
