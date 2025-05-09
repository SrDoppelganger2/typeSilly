extends CharacterBody2D

@onready var sprite = $Sprite2D

const SPEED = -200.0;
const ACCEL = 4;
#TODO modularizar esses stats para facilitar upgrades (talvez não seja necessário)
var health = 5;
var maxHealth = 5;
#vetor que recebe valores de x e y
var input: Vector2;

#var de experiência e de nível
#XP acumulado
var exp = 0
var exp_level = 1
#XP que acabou de ser coletado
var collected_exp = 0

#var de upgrades
var collectedUpgrades = [];
var availableUpgrades = [];

#atributos para upgrade
var armor = 0;
var speedUpgrade = 0;
var attackCooldown = 0.3;
var damage = 1;

signal setDamage;

func _ready():
	sprite.play("default");
	setExpBar(exp, calculateRequiredXP());
	

#resolve o problema de diagonal ser mais rápida
func getInput():
	input.x = Input.get_action_strength("left") - Input.get_action_strength("right");
	input.y = Input.get_action_strength("up") - Input.get_action_strength("down");
	return input.normalized();

func getHurt():
	health -= 1;
	updateHealthBar();
	sprite.play("hurt");
	#TODO adicionar animação de morte e tela de gameover para chamar aqui
	if health <= 0:
		Killzone.death();

func updateHealthBar():
	%PlayerHealthBar.max_value = maxHealth;
	%PlayerHealthBar.value = health;
	%healthLabel.text = str(health,"/",maxHealth);

func _physics_process(_delta):
	var direction = getInput();
	velocity = direction * (SPEED + speedUpgrade);
	
	move_and_slide();

func _on_sprite_2d_animation_finished():
	sprite.play("default");

#lógica de níveis e exp
@onready var ExpBar = get_node("%EXP");
@onready var LvLabel = get_node("%Lv_label");
@onready var XpLabel = get_node("%xpLabel");

@onready var LvUpPanel = get_node("%LevelUp");
@onready var upgradeOptions = get_node("%UpgradeOptions");

@onready var upgradeCards = preload("res://scenes/upgrade_option.tscn");

func _on_grab_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("coletavel"):
		area.target = self;

func _on_collect_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("coletavel"):
		var exp_orb = area.collected();
		calculateXP(exp_orb);

func calculateXP(exp_orb):
	var required_exp = calculateRequiredXP();
	collected_exp += exp_orb;
	
	#sobe de nível 
	if exp + collected_exp >= required_exp:
		collected_exp -= required_exp - exp;
		exp_level += 1;
		exp = 0;
		required_exp = calculateRequiredXP();
		#print("seu nível agr é:", exp_level);
		%Melan.show();
		%MelanTimer.start();
		levelUp();
	else:
		exp += collected_exp;
		collected_exp = 0;
		#print("exp:",exp,"/",required_exp);
		
	XpLabel.text = str(exp,"/", calculateRequiredXP());
	setExpBar(exp, required_exp);

func calculateRequiredXP():
	var exp_cap = exp_level;
	
	#TODO pensar numa formula de XP mais interessante
	if exp_level < 20:
		exp_cap = exp_level * 5;
	else:
		exp_cap = exp_level * 10;
	
	return exp_cap;

func setExpBar(set_value = 1, max_value = 100):
	ExpBar.value = set_value;
	ExpBar.max_value = max_value;
	

func levelUp():
	LvLabel.text = str("Level: ",exp_level);
	#animação de mostra o menu de upgrades
	LvUpPanel.show();
	var panelAnimation = LvUpPanel.create_tween();
	panelAnimation.tween_property(LvUpPanel,"position",Vector2(354,17),0.4).set_trans(panelAnimation.TRANS_QUINT).set_ease(panelAnimation.EASE_IN);
	panelAnimation.play();
	
	var options = 0
	var maxOptions = 3
	
	while options < maxOptions:
		var card = upgradeCards.instantiate();
		card.upgrade = getRandomUpgrade();
		upgradeOptions.add_child(card);
		options += 1;
	
	get_tree().paused = true;

# lógica de upgrades
func playerUpgrades(upgrade):
	
	applyUpgrade(upgrade);
	
	var optionChildren = upgradeOptions.get_children();
	for c in optionChildren:
		c.queue_free();
	availableUpgrades.clear();
	collectedUpgrades.append(upgrade);
	LvUpPanel.hide();
	LvUpPanel.position = Vector2(929.0,17.0);
	get_tree().paused = false;
	calculateXP(0);

func getRandomUpgrade():
	var db = [];
	
	for i in UpgradeDb.UPGRADES:
		if i in collectedUpgrades: #ignora upgrades já escolhidos
			pass
		elif i in availableUpgrades: #se o upgrade já for uma opção, ignora
			pass
		#elif UpgradeDb.UPGRADES[i]["type"] == "item": 
			#pass
		elif UpgradeDb.UPGRADES[i]["prerequisite"].size() > 0: #checa prerequisitos
			for n in UpgradeDb.UPGRADES[i]["prerequisite"]:
				if not n in collectedUpgrades:
					pass
				else:
					db.append(i);
		else:
			db.append(i);
		
	if db.size() > 0:
		var randomUpgrade = db.pick_random();
		availableUpgrades.append(randomUpgrade);
		return randomUpgrade;
	else:
		return null;

func applyUpgrade(upgrade):
	match upgrade:
		"melancia":
			health += 2
			health = clamp(health, 0, maxHealth);
			updateHealthBar();
		"vitalidade1":
			maxHealth += 1
			health += 1
			health = clamp(health, 0, maxHealth);
			updateHealthBar();
		"vitalidade2":
			maxHealth += 2
			health += 2
			health = clamp(health, 0, maxHealth);
			updateHealthBar();
		"vitalidade3":
			maxHealth += 3
			health += 3
			health = clamp(health, 0, maxHealth);
			updateHealthBar();
		"vitalidade4":
			maxHealth += 4
			health += 4
			health = clamp(health, 0, maxHealth);
			updateHealthBar();
		"agilidade1":
			speedUpgrade += SPEED * 0.1;
		"agilidade2":
			speedUpgrade += SPEED * 0.2;
		"agilidade3":
			speedUpgrade += SPEED * 0.3;
		"agilidade3":
			speedUpgrade += SPEED * 0.4;
		"berserk1":
			damage += 1;
			setDamage.emit(damage);
		"berserk2":
			damage += 1;
			setDamage.emit(damage);
		"berserk3":
			damage += 1;
			setDamage.emit(damage);
		"destreza1":
			attackCooldown = 0.3;
			%fireRate.set_wait_time(attackCooldown);
		"destreza2":
			attackCooldown = 0.2;
			%fireRate.set_wait_time(attackCooldown);
