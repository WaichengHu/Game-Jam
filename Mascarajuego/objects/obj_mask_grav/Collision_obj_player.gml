event_inherited();
if (global.first_grav) {
	instance_create_depth(other.x, other.y, -9999, obj_director);
	global.first_grav = false;
}
instance_destroy();

