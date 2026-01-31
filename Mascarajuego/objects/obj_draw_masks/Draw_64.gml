// 1. Obtenemos la altura total de la interfaz
var gui_h = display_get_gui_height();

// 2. Recorremos el vector
var len = array_length(global.vector_sprites_mascaras);

// Configuración extra para el diseño
var padding = 6; // Espacio entre el sprite y el borde del cuadrado
var grosor_borde = 4; // Qué tan grueso es el borde blanco

for (var i = 0; i < len; i++) {
    
    // Obtenemos el sprite actual
    var spr_actual = global.vector_sprites_mascaras[i];
    
    if (is_string(spr_actual)) {
        spr_actual = asset_get_index(spr_actual);
    }
    
    if (!sprite_exists(spr_actual)) continue;

    // --- CÁLCULOS ---
    
    // Obtenemos ancho y alto real del sprite escalado
    var s_ancho = sprite_get_width(spr_actual) * escala;
    var s_alto = sprite_get_height(spr_actual) * escala;

    // Posición X e Y donde iría el sprite
    var draw_x = margen_x + (i * separacion);
    var draw_y = gui_h - margen_y - s_alto;

    // Coordenadas del Cuadrado (caja)
    // Restamos padding para que la caja sea más grande que el sprite
    var box_x1 = draw_x - padding;
    var box_y1 = draw_y - padding;
    var box_x2 = draw_x + s_ancho + padding;
    var box_y2 = draw_y + s_alto + padding;

    // --- DIBUJO ---

    // A. DIBUJAR EL CUADRADO (Borde Grueso)
    draw_set_color(c_white);
    
    // Truco: dibujamos 3 rectángulos uno encima de otro expandiéndose para simular grosor
    for (var g = 0; g < grosor_borde; g++) {
        draw_rectangle(box_x1 - g, box_y1 - g, box_x2 + g, box_y2 + g, true);
    }


    // C. DIBUJAR EL SPRITE
    // Nota: draw_sprite_ext usa su propio color, así que no le afecta el draw_set_color anterior
    draw_sprite_ext(
        spr_actual, 
        0,          
        draw_x, 
        draw_y, 
        escala, 
        escala, 
        0,          
        c_white, 
        1           
    );
}

// RESTAURAR VALORES (Buena práctica para no afectar otros dibujos)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

