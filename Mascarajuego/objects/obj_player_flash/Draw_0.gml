draw_self();

if (instance_exists(obj_player)) {
    
    // --- CONFIGURACIÓN ---
    var _separacion = 16; 
    var _spr_punto = spr_part_prurple; // PON AQUÍ EL NOMBRE DE TU SPRITE (una bolita blanca o círculo)
    
    // --- CÁLCULOS ---
    var _x1 = x;
    var _y1 = y;
    var _x2 = obj_player.x;
    var _y2 = obj_player.y;
    
    var _dir = point_direction(_x1, _y1, _x2, _y2);
    var _dist_total = point_distance(_x1, _y1, _x2, _y2);
    
    gpu_set_fog(true, c_purple, 0, 0);

    // --- BUCLE DE DIBUJO ---
    for (var i = 0; i < _dist_total; i += _separacion) {
        
        var _dx = x + lengthdir_x(i, _dir);
        var _dy = y + lengthdir_y(i, _dir);
        
        // Aquí usamos tu bloque de dibujo
        draw_sprite_ext(
            _spr_punto, // El sprite que usaremos para el punto
            0,          // Subimagen (frame)
            _dx, _dy,   // Posición calculada
            1, 1,       // Escala (xs, ys)
            _dir,       // Ángulo (ang) - Si el punto es redondo da igual, si es una raya, esto lo orienta
            c_white,    // Color (El fog lo sobrescribe a morado de todos modos)
            0.5         // Transparencia (alpha)
        );
    }
	
	draw_sprite_ext(

    spr,

    img,

    x, y,

    xs, ys,

    ang,

    c_white, 

    0.5

	);
    
    // --- DESACTIVAR EL EFECTO AL TERMINAR ---
    // Muy importante apagarlo o todo tu juego se verá morado
    gpu_set_fog(false, c_white, 0, 0);
}