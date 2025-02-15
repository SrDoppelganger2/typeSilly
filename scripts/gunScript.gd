extends Node2D

var mousePos
@onready var weaponSlot = $"..";
@onready var weaponSprite = $Sprite2D;

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pega as coordenadas do mouse na tela
	mousePos = get_global_mouse_position();
	weaponSlot.look_at(mousePos);
	
	#inverte o sprite da arma quando gira em 180 graus
	#faz a arma só girar até 360 graus
	var weaponRotation = wrap(weaponSlot.rotation_degrees, 0, 360);
	if weaponRotation > 90 and weaponRotation < 270:
		weaponSprite.flip_v = true;
	else:
		weaponSprite.flip_v = false;
