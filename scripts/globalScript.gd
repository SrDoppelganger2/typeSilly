extends Node

var chosenWeapon;

func setWeapon(weapon):
	chosenWeapon = weapon;
	print("a arma escolhida foi:", chosenWeapon);

func getWeapon():
	if chosenWeapon == null:
		return "pistol";
	else:
		return chosenWeapon;
