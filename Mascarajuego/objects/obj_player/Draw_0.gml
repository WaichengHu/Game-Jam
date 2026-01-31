//dibujar la mascara que lleva;
draw_self()
if (mask != "default") {
	if (mask == "dash") {
		draw_sprite_ext(spr_mask_dash_eq,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	} else if (mask == "cloud") {
		draw_sprite_ext(spr_mask_cloud_eq,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	} else if (mask == "flash") {
		draw_sprite_ext(spr_mask_flash_eq,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	} else if (mask == "gravedad") {
		draw_sprite_ext(spr_mask_grav_eq,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	} else if (mask == "mario") {
		draw_sprite_ext(spr_mask_mario_eq,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}
