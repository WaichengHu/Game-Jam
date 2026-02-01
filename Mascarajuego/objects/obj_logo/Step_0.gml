if (image_alpha < 1) {image_alpha += 0.1}

if (sound and image_alpha >= 1) {audio_play_sound(snd_logo,20,0); sound = false;}

timer--;

if timer <= 0 {
	if (!instance_exists(obj_transicion)) {
	    var _tran = instance_create_depth(0, 0, -9999, obj_transicion);
	    _tran.target_room = room_next(room);
	}
}