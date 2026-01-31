event_inherited();
if (global.first_cloud) {
	instance_create_depth(other.x, other.y, -9999, obj_director);
	global.first_cloud = false;
}
instance_destroy();
