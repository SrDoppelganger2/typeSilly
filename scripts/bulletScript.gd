extends Node2D

const SPEED = 500.0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move a bala na direção que a arma está apontando
	position += transform.x * SPEED * delta;
