extends Node

const ICON_PATH = "res://assets/itens/upgrades/";
const GUNS_PATH = ""; #talvez não precise

const UPGRADES ={
	"melancia":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"melancia",
		"details":"cura 20% de vida",
		"level":"Level: n/a",
		"prerequisite":[], 
		"type":"item"
	},
	"mais_velocidade":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"mais velocidade",
		"details":"adiciona +5% velocidade de movimento",
		"level":"Level: n/a",
		"prerequisite":[], 
		"type":"item"
	},
	"berserk1":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"mais dano",
		"details":"dê mais dano",
		"level":"Level: 1",
		"prerequisite":[], 
		"type":"item"
	},
	"berserk2":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"mais dano",
		"details":"dê mais dano",
		"level":"Level: 2",
		"prerequisite":["berserk1"], 
		"type":"item"
	},
	"berserk3":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"mais dano",
		"details":"dê mais dano",
		"level":"Level: 3",
		"prerequisite":["berserk2"], 
		"type":"item"
	},
	"berserk4":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"mais dano",
		"details":"dê mais dano",
		"level":"Level: 4",
		"prerequisite":["berserk3"], 
		"type":"item"
	},
	"berserk5":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"mais dano",
		"details":"dê mais dano",
		"level":"Level: 5",
		"prerequisite":["berserk4"], 
		"type":"item"
	},
	"vitalidade1":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Vitalidade",
		"details":"adiciona mais 1 ponto de vida máxima",
		"level":"Level: 1",
		"prerequisite":[], 
		"type":"item"
	},
	"vitalidade2":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Vitalidade",
		"details":"adiciona mais 2 pontos de vida máxima",
		"level":"Level: 2",
		"prerequisite":["vitalidade1"], 
		"type":"item"
	},
	"vitalidade3":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Vitalidade",
		"details":"adiciona mais 4 pontos de vida máxima",
		"level":"Level: 3",
		"prerequisite":["vitalidade2"], 
		"type":"item"
	},
	"vitalidade4":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Vitalidade",
		"details":"adiciona mais 5 pontos de vida máxima",
		"level":"Level: 3",
		"prerequisite":["vitalidade3"], 
		"type":"item"
	},
}
