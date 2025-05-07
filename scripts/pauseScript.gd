extends Control

signal retomarJogo;
signal sairJogo;

func _on_retomar_pressed() -> void:
	retomarJogo.emit();
	
func _on_sair_do_jogo_pressed() -> void:
	sairJogo.emit();
	print("sair emitido");
