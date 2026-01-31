image_index = 0;
if instance_exists(obj_player){
	if obj_player.bloque_cambiado {
		image_index = 0;
		mask_index = spr_blue_block;
	} else {
		image_index = 1;
		mask_index = spr_empty;
	}
	
}