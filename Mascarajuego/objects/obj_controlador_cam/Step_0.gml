// Resolución base
base_w = 320;
base_h = 208;

// Escala máxima entera que cabe en pantalla
scale = min(display_get_gui_width() / base_w, display_get_gui_height() / base_h);
scale = floor(scale);
if (scale < 1) scale = 1;

// Tamaño de viewport escalada
vp_w = base_w * scale;
vp_h = base_h * scale;

// Centrar viewport respecto a la GUI (no al display)
vp_x = floor((display_get_gui_width() - vp_w) / 2);
vp_y = floor((display_get_gui_height() - vp_h) / 2);

// Aplicar viewport
view_set_wport(0, vp_w);
view_set_hport(0, vp_h);
view_set_xport(0, vp_x);
view_set_yport(0, vp_y);
