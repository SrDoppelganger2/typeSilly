extends Node

@onready var mainMenu = $mainMenu;
@onready var action = $action;


@onready var accept: AudioStreamPlayer = $accept
@onready var denied: AudioStreamPlayer = $denied


func playMusic(track):
	match track:
		"mainMenu":
			if mainMenu.playing:
				return;
			action.playing = false;
			mainMenu.playing = true;
		"action":
			if action.playing:
				return;
			mainMenu.playing = false;
			action.playing = true;
		_:
			mainMenu.playing = false;
			action.playing = false;

func playEffect(track):
	match track:
		"accept":
			accept.play();
		"denied":
			denied.play();
		_:
			accept.play();
