function player_reversed(){
    //variables
    var horiz = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var jump_pressed = keyboard_check_pressed(vk_space);
    var jump_held = keyboard_check(vk_space);
    var action = keyboard_check(ord("K"));
    
    flash_timer--;
    gravi_timer--;

    //cosas varias
    image_angle = 0;
    image_yscale = -1; // <--- PERSONAJE INVERTIDO VISUALMENTE

    // DETECCIÓN DE SUELO (AHORA ES EL TECHO, Y - 1)
    if (place_meeting(x, y - 1, obj_solid)) {
        coyote_timer = coyote_max;
        dash_timer = 12;
    } else {
        coyote_timer--;
    }

    // MOVIMIENTO HORIZONTAL (IGUAL)
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

    // SALTO (AHORA VA HACIA ABAJO, POSITIVO)
    if (jump_pressed && coyote_timer > 0) {
        vsp = jump_spd; // Positivo para bajar (alejarse del techo)
        coyote_timer = 0;
    }

    // GRAVEDAD INVERTIDA (TIRA HACIA ARRIBA, NEGATIVO)
    // Si vsp > 0 significa que estamos "saltando" (cayendo hacia el suelo real)
    if (vsp > 0 && jump_held) {
        vsp -= jump_hold_grav; // Restamos gravedad (tira hacia arriba)
    } else {
        vsp -= grv; // Restamos gravedad (tira hacia arriba)
    }

    // CLAMP INVERTIDO (El tope de caída es hacia arriba, negativo)
    vsp = clamp(vsp, -max_fall, jump_spd);

    if (place_meeting(x, y + vsp, obj_solid)) {
        while (!place_meeting(x, y + sign(vsp), obj_solid)) {
            y += sign(vsp);
        }
        vsp = 0;
    }

    y += vsp;
    
    // TORNADO (IMPULSO HACIA EL SUELO REAL, POSITIVO)
    if (instance_exists(obj_tornado) and (abs(obj_tornado.x - x) < 8)) {
        vsp = jump_spd;
    }
    

    //switch de states de mascaras
    if (mask == "dash") {
        instance_create_depth(x,y,depth+1,obj_part_fire);
        if (action and dash_timer >= 12) {
            image_angle -= 90 * image_xscale; // Nota: al estar invertido el yscale, esto rotará visualmente correcto
            dash = true;
        }
    } else if (mask == "cloud") {
        // CAMBIADO Y+1 POR Y-1 PARA DETECTAR TECHO
        if (action and !instance_exists(obj_tornado) and (place_meeting(x, y - 1, obj_solid))) {
            instance_create_depth(x,y,depth+1, obj_tornado);
        } else if (action and instance_exists(obj_tornado) and (place_meeting(x, y - 1, obj_solid))) {
            obj_tornado.x = x; obj_tornado.y = y;
        }
        
    } else if (mask == "flash") {
        if (action and flash_timer <= 0) {
            if (is_flash) {
                x = flash_x;
                y = flash_y;
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
        }
    } else if (mask == "gravedad") {
        if (action and gravi_timer <= 0) {
            if gravedad_normal {gravedad_normal = false;} else 
            {gravedad_normal = true;}
            gravi_timer = 60;
        }
    } else if (mask == "mario") {
		if (action and bloque_timer <= 0) {
			if bloque_cambiado {bloque_cambiado = false} else {bloque_cambiado = true}
			bloque_timer = 15;
		}
	}
	
	bloque_timer--;


    //animaciones
    // CAMBIADO Y+1 POR Y-1
    if (place_meeting(x, y - 1, obj_solid)) {
        //no esta en el aire (está en el techo)
        if (hsp != 0) {
            sprite_index = walk;
            image_speed = 1;
        } else {
            sprite_index = idle;
            image_speed = 0.3;
        }
    } else {
        sprite_index = idle; // O tu sprite de salto si tienes
        image_speed = 0;
    }
    
    // XSCALE se maneja aparte del YSCALE que fijamos al principio
	if (hsp < 0) {
		image_xscale = -1;
	} else if (hsp > 0) {
		image_xscale = 1;
	}
}