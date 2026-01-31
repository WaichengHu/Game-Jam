
if (!instance_exists(obj_transicion) and !instance_exists(obj_director)) {
	if (dash) {
	    player_dash();
	}
	else {
		if (gravedad_normal) {
		   player_normal();
		} else {
			player_reversed();
		}

	}
} else {
	image_speed = 0;
	hspeed = 0;
	vspeed = 0;
}

if keyboard_check(ord("R")) {
	if (!instance_exists(obj_transicion)) {
	    var _tran = instance_create_depth(0, 0, -9999, obj_transicion);
	    _tran.target_room = room;
	}
}