
if (image_alpha <= 0) {
	instance_destroy()
}
image_xscale -= 0.05
image_yscale -= 0.05

timer--;
if (timer <= 0) {image_alpha -=0.05;}