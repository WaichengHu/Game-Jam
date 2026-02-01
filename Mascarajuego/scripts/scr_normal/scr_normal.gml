
function player_normal(){
	//variables
	var horiz = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var jump_pressed = keyboard_check_pressed(vk_space);
	var jump_held = keyboard_check(vk_space);
	var action = keyboard_check(ord("K"));
	
	flash_timer--;
	gravi_timer--;
	image_yscale = 1;

	//cosas varias
	
	image_angle = 0;
	
	timer_steps--;
	
	if hsp != 0 and timer_steps < 0 and place_meeting(x, y + 1, obj_solid){
		audio_play_sound(snd_walk,79,0);
		timer_steps = 130;
	}
	if hsp = 0 {
		audio_stop_sound(snd_walk);
		timer_steps = 0;
	}
	
	if (place_meeting(x, y + 1, obj_solid)) {
	    coyote_timer = coyote_max;
		dash_timer = 12;
		
	} else {
	    coyote_timer--;
		audio_stop_sound(snd_walk);
		timer_steps = 0;
	}

	if (horiz != 0) {
	    if (hsp < horiz * walk_spd) {
	        hsp = min(hsp + accel, horiz * walk_spd);
	    } else if (hsp > horiz * walk_spd) {
	        hsp = max(hsp - accel, horiz * walk_spd);
	    }
	} else {
	    if (hsp > 0) {
	        hsp = max(hsp - friction, 0);
	    } else if (hsp < 0) {
	        hsp = min(hsp + friction, 0);
	    }
	}

	if (place_meeting(x + hsp, y, obj_solid)) {
	    while (!place_meeting(x + sign(hsp), y, obj_solid)) {
	        x += sign(hsp);
	    }
	    hsp = 0;
	}
	x += hsp;

	if (jump_pressed && coyote_timer > 0) {
		audio_play_sound(snd_jump,20,0);
	    vsp = -jump_spd;
	    coyote_timer = 0;
	}

	if (vsp < 0 && jump_held) {
	    vsp += jump_hold_grav;
	} else {
	    vsp += grv;
	}

	vsp = clamp(vsp, -jump_spd, max_fall);

	if (place_meeting(x, y + vsp, obj_solid)) {
	    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
	        y += sign(vsp);
	    }
	    vsp = 0;
	}

		
		
	y += vsp;
	
		
	if (instance_exists(obj_tornado) and (abs(obj_tornado.x - x) < 8)) {
		vsp = -jump_spd;
	}
	

	//switch de states de mascaras

	if (mask == "dash") {
		instance_create_depth(x,y,depth+1,obj_part_fire);
		if (action and dash_timer >= 12) {
			image_angle -= 90 * image_xscale;
			audio_play_sound(snd_dash,50,0);
			dash = true;
		}
	} else if (mask == "cloud") {
		if (action and !instance_exists(obj_tornado) and (place_meeting(x, y + 1, obj_solid))) {
			instance_create_depth(x,y,depth+1, obj_tornado);
		} else if (action and instance_exists(obj_tornado) and (place_meeting(x, y + 1, obj_solid))) {
			obj_tornado.x = x; obj_tornado.y = y;
		}
		
	} else if (mask == "flash") {
		if (action and flash_timer <= 0) {
			if (is_flash) {
				x = flash_x;
				y = flash_y;
				audio_play_sound(snd_tp,53,0)
				is_flash = false;
			} else {
				flash_x = x;
				flash_y = y;
				is_flash = true;
			
			}
			flash_timer = 15;
		}
		if (is_flash and !instance_exists(obj_player_flash)) {
			instance_create_depth(x,y,depth+1, obj_player_flash);
			audio_play_sound(snd_tp,53,0)
		}
	} else if (mask == "gravedad") {
		if (action and gravi_timer <= 0) {
			if gravedad_normal {gravedad_normal = false;} else 
			{gravedad_normal = true;}
			gravi_timer = 60;
			audio_play_sound(snd_grav,52,0)
		}
	} else if (mask == "mario") {
		if (action and bloque_timer <= 0) {
			if bloque_cambiado {bloque_cambiado = false} else {bloque_cambiado = true}
			bloque_timer = 15;
			audio_play_sound(snd_block,34,0);
		}
	} else if (mask == "bomba") {
		bomb_timer--;
		if (bomb_timer % 60 == 0) {
			bomb_timer_2 --;
		}
		if (bomb_timer <= 0 or action) {
			effect_create_depth(-1,ef_spark,x,y,30,c_red);
			effect_create_depth(-1,ef_cloud,x,y,30,c_orange);
			effect_create_depth(-1,ef_explosion,x,y,30,c_yellow);
			effect_create_depth(-1,ef_ring,x,y,30,c_red);
			var _tran = instance_create_depth(0,0,-9999,obj_transicion);
			audio_play_sound(snd_boom,1,0);
			_tran.target_room = room;
		}
	}
	
	bloque_timer--;
	


	//animaciones
	if (place_meeting(x, y + 1, obj_solid)) {
		//no esta en el aire
		if (hsp != 0) {
			sprite_index = walk;
			image_speed = 1;
		

		} else {
			sprite_index = idle;
			image_speed = 0.3;
		}
	} else {
		sprite_index = idle;
		image_speed = 0;
	}
	
	if (hsp < 0) {
		image_xscale = -1;
	} else if (hsp > 0) {
		image_xscale = 1;
	}


}