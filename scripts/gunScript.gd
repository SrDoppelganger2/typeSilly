extends Node2D

var mousePos
@onready var gun_slot = $".."

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pega as coordenadas do mouse na tela
	mousePos = get_global_mouse_position();
	gun_slot.look_at(mousePos);
