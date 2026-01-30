//variables
var horiz = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump_pressed = keyboard_check_pressed(vk_space);
var jump_held = keyboard_check(vk_space);


//cosas varias

if (place_meeting(x, y + 1, obj_solid)) {
    coyote_timer = coyote_max;
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

//switch de states de mascaras