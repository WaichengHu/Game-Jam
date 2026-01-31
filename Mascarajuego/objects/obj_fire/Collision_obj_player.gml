if (!obj_player.dash) {
	if (!instance_exists(obj_transicion)) {
    var _tran = instance_create_depth(0, 0, -9999, obj_transicion);
    _tran.target_room = room;
	}
} else {
	instance_destroy();
}