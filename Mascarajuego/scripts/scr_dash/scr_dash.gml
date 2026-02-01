
function player_dash(){
	dash_timer--;
	if (dash_timer <= 0) {
		vsp = 0;
		dash = false;
	}
	
	instance_create_depth(x,y,depth+1,obj_part_fire);
	instance_create_depth(x,y,depth+1,obj_part_fire);
	instance_create_depth(x,y,depth+1,obj_part_fire);
	
	if (dash_timer % 3 == 0) instance_create_depth(x,y,depth+1,obj_player_echo);
	
	
	var spdh = 4 * image_xscale;
	
	if (place_meeting(x + spdh , y, obj_solid)) {
	    spdh = 0;
		dash = false;

	}
	
	x += spdh;
}