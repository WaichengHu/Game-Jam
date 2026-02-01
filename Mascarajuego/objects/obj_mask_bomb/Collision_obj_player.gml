event_inherited();
if (global.first_bomba) {
	instance_create_depth(other.x, other.y, -9999, obj_director);
	global.first_bomba = false;
}
instance_destroy();

