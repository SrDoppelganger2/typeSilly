extends Node

var chosenWeapon;

signal loadConfig;

func setWeapon(weapon):
	chosenWeapon = weapon;

func getWeapon():
	if chosenWeapon == null:
		return "pistol";
	else:
		return chosenWeapon;
