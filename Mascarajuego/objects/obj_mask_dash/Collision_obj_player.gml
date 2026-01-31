event_inherited();
if (global.first_dash) {
	instance_create_depth(other.x, other.y, -9999, obj_director);
	global.first_dash = false;
}
instance_destroy();

