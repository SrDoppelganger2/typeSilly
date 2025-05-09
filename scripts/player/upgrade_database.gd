extends Node

const ICON_PATH = "res://assets/itens/upgrades/";
const GUNS_PATH = ""; #talvez não precise

const UPGRADES ={
	"melancia1":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"melancia",
		"details":"Placeholder bla bla bla",
		"level":"Level: 1",
		"prerequisite":[], 
		"type":"item"
	},
	"melancia2":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"melancia",
		"details":"Melancia, parte 2",
		"level":"Level: 2",
		"prerequisite":["melancia1"], 
		"type":"item"
	},
	"melancia3":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"melancia",
		"details":"Melancia, parte 3",
		"level":"Level: 3",
		"prerequisite":["melancia2"], 
		"type":"item"
	}
}
