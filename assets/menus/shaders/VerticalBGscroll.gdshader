shader_type canvas_item;

void vertex() {
	UV.y += TIME * .1;
	UV.x += TIME * .1;
	//Adicionar quando tiver BG definitivo
	//UV.y -= TIME * .1;
}
