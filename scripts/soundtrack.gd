extends Node

@onready var mainMenu = $mainMenu;
@onready var action = $action;

func playMusic(track):
	match track:
		"mainMenu":
			action.playing = false;
			mainMenu.playing = true;
		"action":
			mainMenu.playing = false;
			action.playing = true;
		_:
			mainMenu.playing = true;
		
