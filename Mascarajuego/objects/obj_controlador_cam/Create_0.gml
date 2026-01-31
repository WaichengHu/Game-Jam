// Resolución base de tu juego
base_w = 320;
base_h = 208;

// Pixel art nítido (sin interpolación)
gpu_set_texfilter(false);


// Setup básico de views y cámara
view_enabled = true;
view_set_visible(0, true);

cam = view_camera[0];
camera_set_view_size(cam, base_w, base_h);
camera_set_view_pos(cam, 0, 0);
