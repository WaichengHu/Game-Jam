hsp = 0;
vsp = 0;

walk_spd = 1.5;
accel = 0.5;
friction = 0.65;

jump_spd = 4;
grv = 0.35;
max_fall = 8;

coyote_max = 6;
coyote_timer = 0;

jump_hold_grav = 0.18;

global.vector_mascaras = [];
global.vector_sprites_mascaras = [];

mask = "default";

idle = spr_bicho_idle;
walk = spr_bicho_walk;
dash = false;
dash_timer = 15;

used_cloud = false;

flash_timer = 15;
is_flash = false;
flash_x = x;
flash_y = y;

gravedad_normal = true;
gravi_timer = 60;

bloque_timer = 15;
bloque_cambiado = false;
