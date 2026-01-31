// Asegurarnos de que el jugador existe, si no, abortamos
if (!instance_exists(obj_player)) {
    instance_destroy();
    exit;
}

var _cur_w = camera_get_view_width(cam);
var _cur_h = camera_get_view_height(cam);
var _new_w, _new_h;

switch(fase) {
    case 0: // --- FASE ZOOM IN ---
        // Lerp hacia el tamaño objetivo (más pequeño)
        _new_w = lerp(_cur_w, target_w, velocidad_zoom);
        _new_h = lerp(_cur_h, target_h, velocidad_zoom);
        
        // Efecto visual: El sprite crece
        efecto_scale = lerp(efecto_scale, 2, 0.1); // Crece hasta el doble de tamaño
        
        // Si estamos muy cerca del tamaño objetivo, pasamos a la fase de espera
        if (abs(_new_w - target_w) < 2) {
            fase = 1;
        }
        break;

    case 1: // --- FASE ESPERA ---
        // Mantenemos el zoom objetivo
        _new_w = target_w;
        _new_h = target_h;
        
        // Efecto visual: Sigue grande y empieza a desvanecerse un poco
        efecto_scale = lerp(efecto_scale, 2.2, 0.05); 
        efecto_alpha = lerp(efecto_alpha, 0.8, 0.05);
        
        // Cuenta atrás
        timer_espera--;
        if (timer_espera <= 0) {
            fase = 2; // Pasamos a zoom out
        }
        break;

    case 2: // --- FASE ZOOM OUT (Volver a la normalidad) ---
        // Lerp hacia el tamaño base original
        _new_w = lerp(_cur_w, base_w, velocidad_zoom);
        _new_h = lerp(_cur_h, base_h, velocidad_zoom);
        
        // Efecto visual: Desaparece rápido
        efecto_scale = lerp(efecto_scale, 3, 0.1);
        efecto_alpha = lerp(efecto_alpha, 0, 0.2);

        // Si estamos muy cerca del tamaño original, terminamos
        if (abs(_new_w - base_w) < 2) {
            // Restauramos tamaño exacto por si acaso
            camera_set_view_size(cam, base_w, base_h); 
            instance_destroy(); // ¡Secuencia terminada!
            exit; // Salimos para no aplicar la cámara una última vez mal
        }
        break;
}

// --- APLICAR CÁMARA ---
// 1. Aplicar el nuevo tamaño calculado arriba
camera_set_view_size(cam, _new_w, _new_h);

// 2. IMPORTANTE: Centrar la cámara en el jugador con el nuevo tamaño.
// Como hemos cambiado el tamaño, tenemos que recalcular la posición para que
// el jugador quede en el centro exacto.
var _new_x = obj_player.x - (_new_w / 2);
var _new_y = obj_player.y - (_new_h / 2);

// (Opcional) Clampeamos para no salirnos de la sala, si tu otro código lo hacía
_new_x = clamp(_new_x, 0, room_width - _new_w);
_new_y = clamp(_new_y, 0, room_height - _new_h);

camera_set_view_pos(cam, _new_x, _new_y);