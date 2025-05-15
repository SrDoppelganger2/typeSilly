extends Node2D

@onready var sprite = $Sprite2D;
const SPEED = 500.0;

var bulletDamage = 1;
var type;


func _ready():
	type = GlobalScript.getWeapon();
	
	if type == "pistol":
		sprite.play("melanGun");
	elif type == "shotgun":
		sprite.play("musicGun");
	elif type == "chaingun":
		sprite.play("nyanGun");
	else:
		sprite.play("melanGun");

func setDamage(damage):
	bulletDamage = damage;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		position += transform.x * SPEED * delta;

#remove a bala quando ela sai da camera
#talvez precise retrabalhar essa lógica a depender do design do jogo
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();

#mata os inimigos e tira a bala da cena
func _on_body_entered(body):
	if body.is_in_group("mobs"):
		body.takeDamage(bulletDamage);
	queue_free();
