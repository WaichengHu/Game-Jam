
function player_normal(){
	//variables
	var horiz = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var jump_pressed = keyboard_check_pressed(vk_space);
	var jump_held = keyboard_check(vk_space);
	var action = keyboard_check(ord("K"));
	



	//cosas varias
	
	image_angle = 0;
	
	if (place_meeting(x, y + 1, obj_solid)) {
	    coyote_timer = coyote_max;
		dash_timer = 12;
	} else {
	    coyote_timer--;
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
			dash = true;
		}
	} else if (mask == "cloud") {
		if (action and !instance_exists(obj_tornado) and (place_meeting(x, y + 1, obj_solid))) {
			instance_create_depth(x,y,depth+1, obj_tornado);
		} else if (action and instance_exists(obj_tornado) and (place_meeting(x, y + 1, obj_solid))) {
			obj_tornado.x = x; obj_tornado.y = y;
		}
		
	}	


	//animaciones
	if (!place_meeting(x, y + sign(vsp), obj_solid)) {
		//no esta en el aire
		if (hsp != 0) {
			sprite_index = walk;
			image_speed = 1;
		
			if (hsp < 0) {
				image_xscale = -1;
			} else {
				image_xscale = 1;
			}
		} else {
			sprite_index = idle;
			image_speed = 0.3;
		}
	}


}