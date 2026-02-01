if global.masks == global.total_masks {
	if (!instance_exists(obj_transicion)) {
    var _tran = instance_create_depth(0, 0, -9999, obj_transicion);
	audio_play_sound(snd_transition,12,0)
    _tran.target_room = room_next(room); // O el nombre de tu sala: rm_Nivel2
}
}