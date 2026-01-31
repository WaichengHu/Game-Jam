
if (image_alpha <= 0) {
	instance_destroy()
}
if (die) {image_alpha -=0.1; vspeed = -0.5}

vspeed -= 0.1


if place_meeting(x,y,obj_solid) {
	die = true;
}