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
	} else if (mask == "bomba") {
		draw_sprite_ext(spr_mask_bomb_eq,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		var _texto = string(ceil(bomb_timer_2)); 
		var _scale = 1; 
		var _altura = 10;
		var _tx = x;
		var _ty = y - _altura;
		var _off = 1 * _scale;
		if (_off < 1) _off = 1;
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_set_color(c_black);
		draw_text_transformed(_tx + _off, _ty, _texto, _scale, _scale, 0);
		draw_text_transformed(_tx - _off, _ty, _texto, _scale, _scale, 0);
		draw_text_transformed(_tx, _ty + _off, _texto, _scale, _scale, 0);
		draw_text_transformed(_tx, _ty - _off, _texto, _scale, _scale, 0);
		draw_set_color(c_yellow);
		draw_text_transformed(_tx, _ty, _texto, _scale, _scale, 0);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
	}
}


