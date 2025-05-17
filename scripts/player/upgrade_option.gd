extends TextureRect

@onready var nameLabel = $nameLabel;
@onready var descriptionLabel = $descriptionLabel;
@onready var levelLabel = $levelLabel;
@onready var icone = $iconTexture;

var mouseHover = false;
var upgrade = null; 
@onready var player = get_tree().get_first_node_in_group("player");

signal selectedUpgrade(upgrade);

func _ready() -> void:
	connect("selectedUpgrade",Callable(player,"playerUpgrades"));
	
	#deixa um upgrade como default
	if upgrade == null:
		upgrade = "jujuba_peixe";
		
	
	nameLabel.text = UpgradeDb.UPGRADES[upgrade]["displayName"];
	descriptionLabel.text = UpgradeDb.UPGRADES[upgrade]["details"];
	levelLabel.text = UpgradeDb.UPGRADES[upgrade]["level"];
	icone.texture = load(UpgradeDb.UPGRADES[upgrade]["icon"]);
#detecta se o mouse está no card de upgrade
func _on_mouse_entered() -> void:
	mouseHover = true;

func _on_mouse_exited() -> void:
	mouseHover = false;

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click") and mouseHover:
		emit_signal("selectedUpgrade", upgrade);
