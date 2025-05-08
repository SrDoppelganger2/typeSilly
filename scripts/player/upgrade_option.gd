extends ColorRect

var mouseHover = false;
var upgrade = null; 
@onready var player = get_tree().get_first_node_in_group("player");

signal selectedUpgrade(upgrade);

func _ready() -> void:
	connect("selectedUpgrade",Callable(player,"playerUpgrades"));

#detecta se o mouse está no card de upgrade
func _on_mouse_entered() -> void:
	mouseHover = true;

func _on_mouse_exited() -> void:
	mouseHover = false;

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouseHover:
		emit_signal("selectedUpgrade", upgrade)
