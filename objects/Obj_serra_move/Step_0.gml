// Atualiza a posição com base na velocidade
x += vel_x;
y += vel_y;

// Verifica a colisão com paredes
if (place_meeting(x + vel_x, y, Obj_parede)) {
    vel_x = -vel_x; // Inverte a direção horizontal
}

if (place_meeting(x, y + vel_y, Obj_parede)) {
    vel_y = -vel_y; // Inverte a direção vertical
}

// Ajusta a direção para garantir movimento diagonal
if (vel_x != 0 && vel_y != 0) {
    // Confirma que a movimentação continua em uma diagonal
    if (abs(vel_x) > abs(vel_y)) {
        vel_y = sign(vel_y) * abs(vel_x); // Sincroniza com a velocidade x
    } else {
        vel_x = sign(vel_x) * abs(vel_y); // Sincroniza com a velocidade y
    }
}
