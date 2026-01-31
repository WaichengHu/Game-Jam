event_inherited();
if (global.first_flash) {
	instance_create_depth(other.x, other.y, -9999, obj_director);
	global.first_flash = false;
}
instance_destroy();

