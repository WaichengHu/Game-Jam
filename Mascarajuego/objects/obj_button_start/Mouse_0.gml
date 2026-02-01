if (!instance_exists(obj_transicion)) {
	var _tran = instance_create_depth(0, 0, -9999, obj_transicion);
	audio_stop_sound(music_menu);
	_tran.target_room = room_next(room);
}