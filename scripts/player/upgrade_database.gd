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
	"agilidade1":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Agilidade",
		"details":"adiciona +10% velocidade de movimento",
		"level":"Level: 1",
		"prerequisite":[], 
		"type":"item"
	},
	"agilidade2":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Agilidade",
		"details":"adiciona +20% velocidade de movimento",
		"level":"Level: 2",
		"prerequisite":["agilidade1"], 
		"type":"item"
	},
	"agilidade3":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Agilidade",
		"details":"adiciona +30% velocidade de movimento",
		"level":"Level: 3",
		"prerequisite":["agilidade2"], 
		"type":"item"
	},
	"agilidade4":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Agilidade",
		"details":"adiciona +40% velocidade de movimento",
		"level":"Level: 4",
		"prerequisite":["agilidade3"], 
		"type":"item"
	},
	"berserk1":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Berserk Pack",
		"details":"aumenta o dano dos seus ataques",
		"level":"Level: 1",
		"prerequisite":[], 
		"type":"item"
	},
	"berserk2":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Berserk Pack",
		"details":"aumenta o dano dos seus ataques",
		"level":"Level: 2",
		"prerequisite":["berserk1"], 
		"type":"item"
	},
	"berserk3":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Berserk Pack",
		"details":"aumenta o dano dos seus ataques",
		"level":"Level: 3",
		"prerequisite":["berserk2"], 
		"type":"item"
	},
	"destreza1":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"destreza",
		"details":"diminui um pouco o cooldown da sua arma",
		"level":"Level: 1",
		"prerequisite":[], 
		"type":"item"
	},
	"destreza2":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"destreza",
		"details":"diminui muito o cooldown da sua arma",
		"level":"Level: 2",
		"prerequisite":["destreza1"], 
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
		"details":"adiciona mais 3 pontos de vida máxima",
		"level":"Level: 3",
		"prerequisite":["vitalidade2"], 
		"type":"item"
	},
	"vitalidade4":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"Vitalidade",
		"details":"adiciona mais 4 pontos de vida máxima",
		"level":"Level: 3",
		"prerequisite":["vitalidade3"], 
		"type":"item"
	},
	"mais_balas1":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"mais balas",
		"details":"adiciona mais balas para sua shotgun",
		"level":"Level: 1",
		"prerequisite":[],
		"type":"item"
	},
	"mais_balas2":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"mais balas",
		"details":"adicona mais balas para sua shotgun",
		"level":"Level: 2",
		"prerequisite":["mais_balas1"], 
		"type":"item"
	},
	"mais_balas3":{
		"icon": ICON_PATH + "suika.png",
		"displayName":"mais balas",
		"details":"adicona mais balas para sua shotgun",
		"level":"Level: 3",
		"prerequisite":["mais_balas2"], 
		"type":"item"
	},
}
