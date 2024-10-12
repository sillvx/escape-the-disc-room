// Movimento horizontal
x += vel_x;

// Verifica colisão com paredes e inverte a direção
if (place_meeting(x, y + vel_x, Obj_parede)) {
    vel_x = -vel_x;  // Inverte a direção horizontal
}
