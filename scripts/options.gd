extends Node2D

#pega o index dos canais de audio pelo nome
@export var masterAudio = "Master";
@export var musicAudio = "Music";
@export var sfxAudio = "SFX";

@onready var masterBus = AudioServer.get_bus_index(masterAudio);
@onready var musicBus = AudioServer.get_bus_index(musicAudio);
@onready var sfxBus = AudioServer.get_bus_index(sfxAudio);

#nós de audio
@onready var masterVolumeSlider = $CanvasLayer/Settings/volMaster;
@onready var mutar_master: CheckBox = $CanvasLayer/Settings/mutarMaster
@onready var musicVolumeSlider = $CanvasLayer/Settings/volMusica;
@onready var mutar_musica: CheckBox = $CanvasLayer/Settings/mutarMusica
@onready var sfxVolumeSlider = $CanvasLayer/Settings/volSFX;
@onready var mutar_sfx: CheckBox = $CanvasLayer/Settings/mutarSFX


#carrega as configurações salvas
func _ready() -> void:
	var configAudio = ConfigHandler.loadAudioSettings();
	
	loadAudio(configAudio);

func _on_button_pressed():
	Soundtrack.playEffect("denied");
	get_tree().change_scene_to_file("res://scenes/title.tscn");

#configurações de audio
func _on_masterVolume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(masterBus,linear_to_db(value));
func _on_vol_master_drag_ended(value_changed: bool) -> void:
	if value_changed:
		#em caso de erro, colocar / 100 do lado de master volume value
		ConfigHandler.saveAudioSettings("master_volume", masterVolumeSlider.value);
func _on_mutar_master_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(masterBus,toggled_on);
	ConfigHandler.saveAudioSettings("master_muted", toggled_on);


func _on_musicVolume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(musicBus,linear_to_db(value));
func _on_vol_musica_drag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigHandler.saveAudioSettings("music_volume", musicVolumeSlider.value);
func _on_mutar_musica_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(musicBus,toggled_on);
	ConfigHandler.saveAudioSettings("music_muted", toggled_on);


func _on_vol_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfxBus,linear_to_db(value));
func _on_vol_sfx_drag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigHandler.saveAudioSettings("sfx_volume", sfxVolumeSlider.value);
func _on_mutar_sfx_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(sfxBus,toggled_on);
	ConfigHandler.saveAudioSettings("sfx_muted", toggled_on);



#carrega configurações
func loadAudio(configAudio):
	mutar_master.button_pressed = configAudio.master_muted;
	mutar_musica.button_pressed = configAudio.music_muted;
	mutar_sfx.button_pressed = configAudio.sfx_muted;
	
	masterVolumeSlider.value = min(configAudio.master_volume, 1.0);
	musicVolumeSlider.value = min(configAudio.music_volume, 1.0);
	sfxVolumeSlider.value = min(configAudio.sfx_volume, 1.0);
	
	
