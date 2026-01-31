// 1. Aumentar el timer
timer++;

// 2. Calcular porcentaje (0 a 1)
percent = timer / (duration / 2); // Dividimos duración en 2 fases (entrada y salida)

// --- ESTADO 0: CUBRIENDO LA PANTALLA (ENTRADA) ---
if (state == 0) {
    if (percent >= 1) {
        // La pantalla está totalmente negra/cubierta
        percent = 1; // Asegurar tope
        room_goto(target_room); // ¡CAMBIO DE SALA!
        
        // Mover al jugador a una posición segura si es necesario (opcional)
        // if (instance_exists(oPlayer)) ...
        
        state = 1; // Cambiar a fase de salida
        timer = 0; // Reiniciar timer para la salida
    }
}

// --- ESTADO 1: REVELANDO LA PANTALLA (SALIDA) ---
else if (state == 1) {
    if (percent >= 1) {
        // Terminó la transición
        instance_destroy(); // Nos autodestruimos
    }
}