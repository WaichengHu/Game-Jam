var _bar_w = display_get_gui_width();
var _bar_h = display_get_gui_height();

// Calculamos la posición X basada en el estado
var _x1, _x2;

if (state == 0) {
    // FASE 1: La ola entra desde la DERECHA hacia la IZQUIERDA
    // Empieza fuera (derecha) y termina cubriendo todo
    // Usamos 'tweening' simple para mover la coordenada
    _x1 = _bar_w - (_bar_w * percent); // Se mueve de w a 0
    _x2 = _bar_w;
} 
else {
    // FASE 2: La ola se va por la IZQUIERDA
    // La parte derecha del rect se encoge hacia la izquierda
    _x1 = 0;
    _x2 = _bar_w - (_bar_w * percent);
}

// Dibujar el bloque sólido (La "ola")
draw_set_color(color);
draw_rectangle(_x1, 0, _x2, _bar_h, false);

// OPCIONAL: Dibujar un borde decorativo (para que parezca una ola real)
// Si tienes un sprite de borde de ola (spr_ola_borde), descomenta esto:
/*
if (state == 0) draw_sprite_ext(spr_ola_borde, 0, _x1, 0, 1, _bar_h/sprite_get_height(spr_ola_borde), 0, c_white, 1);
else            draw_sprite_ext(spr_ola_borde, 0, _x2, 0, 1, _bar_h/sprite_get_height(spr_ola_borde), 0, c_white, 1);
*/

draw_set_color(c_white);