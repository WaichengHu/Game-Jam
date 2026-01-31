// Configuración
target_room = -1;       // A qué sala vamos
duration = 60;          // Cuántos frames dura (60 = 1 segundo a 60fps)
color = c_black;        // Color de la cortina

// Variables internas (no tocar)
timer = 0;
state = 0;              // 0: Entrando (cubriendo), 1: Saliendo (revelando)
percent = 0;            // 0 a 1
w = display_get_gui_width();
h = display_get_gui_height();