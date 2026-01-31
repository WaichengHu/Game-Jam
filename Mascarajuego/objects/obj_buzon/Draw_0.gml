// 1. Dibuja el objeto primero
draw_self();
draw_set_font(Isaac)
// --- CONFIGURACIÓN ---
var _texto = string(global.masks) + " / " + string(global.total_masks);
var _escala = 0.5; // <--- CAMBIA ESTO: 1 = Normal, 0.5 = Mitad, 2 = Doble

// Posición
// Centro X del objeto (32 / 2 = 16)
var _tx = x + 16; 
// Posición Y: Altura objeto (32) + Separación (16)
var _ty = y + 32 + 10; 

// Grosor del contorno (ajustado a la escala para que no se vea raro)
var _off = 1 * _escala; 
// Si la escala es muy pequeña, fuerza que el borde sea al menos de 1 pixel
if (_off < 1) _off = 1; 

// --- ALINEACIÓN ---
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// --- DIBUJAR CONTORNO (Negro) ---
// Usamos draw_text_transformed para poder aplicar la escala
draw_set_color(c_black);
draw_text_transformed(_tx + _off, _ty, _texto, _escala, _escala, 0); // Derecha
draw_text_transformed(_tx - _off, _ty, _texto, _escala, _escala, 0); // Izquierda
draw_text_transformed(_tx, _ty + _off, _texto, _escala, _escala, 0); // Abajo
draw_text_transformed(_tx, _ty - _off, _texto, _escala, _escala, 0); // Arriba

// --- DIBUJAR TEXTO (Blanco) ---
draw_set_color(c_white);
draw_text_transformed(_tx, _ty, _texto, _escala, _escala, 0);

// --- RESETEAR ---
draw_set_halign(fa_left);
draw_set_valign(fa_top);