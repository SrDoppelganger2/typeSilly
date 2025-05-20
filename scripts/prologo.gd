extends Control

@onready var music: AudioStreamPlayer = $music
@onready var intro: VideoStreamPlayer = $intro


func _ready() -> void:
	music.play();
	
func _process(delta: float) -> void:
	#muda para tela principal qnd acaba a musga
	if !intro.is_playing():
		get_tree().change_scene_to_file("res://scenes/title.tscn");
		
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		Soundtrack.playEffect("accept");
		get_tree().change_scene_to_file("res://scenes/title.tscn");
