extends Node2D

const SPEED = 500.0;

var bulletDamage = 1;

func setDamage(damage):
	bulletDamage = damage;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move a bala na direção que a arma está apontando
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
