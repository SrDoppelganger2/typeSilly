extends Node

var config = ConfigFile.new();
const SETTINGS_PATH = "user://settings.ini";

func _ready() -> void:
	if !FileAccess.file_exists(SETTINGS_PATH):
		config.set_value("audio", "master_volume", 1.0);
		config.set_value("audio", "music_volume", 1.0);
		config.set_value("audio", "sfx_volume", 1.0);
		
		config.save(SETTINGS_PATH);
	else:
		config.load(SETTINGS_PATH);

func saveAudioSettings(key: String, value):
	config.set_value("audio", key, value);
	config.save(SETTINGS_PATH);
	
func loadAudioSettings():
	var audioSettings = {};
	#carrega as configurações de audio
	for key in config.get_section_keys("audio"):
		audioSettings[key] = config.get_value("audio", key);
	
	return audioSettings;
