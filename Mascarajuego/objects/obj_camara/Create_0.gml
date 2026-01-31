// --- CONFIGURACIÓN DE RESOLUCIÓN ---
base_w = 320;
base_h = 208;

gpu_set_texfilter(false); // Pixel art nítido

// Setup básico
view_enabled = true;
view_set_visible(0, true);

cam = view_camera[0];
camera_set_view_size(cam, base_w, base_h);

// --- CONFIGURACIÓN DE MOVIMIENTO ---
target = obj_player; // Cambia esto por el nombre de tu objeto jugador
spd = 0.1; // Velocidad de suavizado (0.1 es suave, 1 es instantáneo)

// Posicionamos la cámara inmediatamente en el jugador al iniciar
if (instance_exists(target)) {
    var _x = target.x - base_w / 2;
    var _y = target.y - base_h / 2;
    _x = clamp(_x, 0, room_width - base_w);
    _y = clamp(_y, 0, room_height - base_h);
    camera_set_view_pos(cam, _x, _y);
}