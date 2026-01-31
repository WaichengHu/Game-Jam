event_inherited();
if (global.first_mario) {
	instance_create_depth(other.x, other.y, -9999, obj_director);
	global.first_mario = false;
}
instance_destroy();

