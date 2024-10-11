// Movimento vertical
y += vel_y;

// Verifica colisão com paredes e inverte a direção
if (place_meeting(x, y + vel_y, Obj_parede))
{
    vel_y = -vel_y;  // Inverte a direção vertical
}



