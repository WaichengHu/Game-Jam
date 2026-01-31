// --- CONFIGURACIÓN ---
zoom_factor = 0.5; // 0.5 significa hacer zoom hasta la mitad del tamaño original (más cerca)
velocidad_zoom = 0.15; // Qué tan rápido entra y sale el zoom (0.01 a 1.0)
duracion_espera = 15; // Cuánto tiempo se queda en zoom máximo (60 frames = 1 segundo)

// --- VARIABLES INTERNAS (No tocar) ---
cam = view_camera[0]; // Obtenemos la cámara activa
base_w = camera_get_view_width(cam);  // Ancho original
base_h = camera_get_view_height(cam); // Alto original

// Calculamos el tamaño objetivo (zoomeado)
target_w = base_w * zoom_factor;
target_h = base_h * zoom_factor;

// Variables para la secuencia
fase = 0; // 0: Zoom IN, 1: Espera, 2: Zoom OUT
timer_espera = duracion_espera;

// Variables para el efecto visual (sprite creciendo)
efecto_scale = 0;
efecto_alpha = 1;