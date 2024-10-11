if (!invulneravel && (place_meeting(x, y, Obj_serra) || place_meeting(x, y, Obj_serra_move) || place_meeting(x, y, Obj_cerra_horizontal) || place_meeting(x, y, Obj_cerra_vertical)))
{
    global.vidas -= 1;  // Perde uma vida
    invulneravel = true;  // Fica invulnerável por um tempo
    invulneravel_timer = 60;  // Define a duração da invulnerabilidade (1 segundo)
    
    // Ativa o tremor da tela ao tomar dano
    with (Obj_controlador) {
        shake_intensity = 8;  // Intensidade do tremor
        shake_duration = 20;  // Duração do tremor (em frames)
    }

    // Se as vidas acabarem
    if (global.vidas <= 0) {
        instance_destroy();  // Destrói o jogador se as vidas chegarem a zero
    }
}


// Se o jogador está invulnerável, reduz o temporizador
if (invulneravel) {
    invulneravel_timer -= 1;
    
    // Quando o tempo de invulnerabilidade acaba, o jogador pode ser atingido novamente
    if (invulneravel_timer <= 0) {
        invulneravel = false;
    }
}

// Código de movimentação aqui
var vel_x = 0;
var vel_y = 0;

// Movimentação para a direita (tecla D)
if (keyboard_check(ord("D"))) {
    vel_x = 2;
}

// Movimentação para a esquerda (tecla A)
if (keyboard_check(ord("A"))) {
    vel_x = -2;
}

// Movimentação para cima (tecla W)
if (keyboard_check(ord("W"))) {
    vel_y = -2;
}

// Movimentação para baixo (tecla S)
if (keyboard_check(ord("S"))) {
    vel_y = 2;
}

// Colisão horizontal
if (!place_meeting(x + vel_x, y, Obj_parede)) {
    x += vel_x; // Mover no eixo X se não houver colisão
}

// Colisão vertical
if (!place_meeting(x, y + vel_y, Obj_parede)) {
    y += vel_y; // Mover no eixo Y se não houver colisão

}

// Troca de sprites baseada no movimento
if (vel_x != 0) {
    sprite_index = Spr_run;  // Sprite de movimento horizontal
    image_xscale = sign(vel_x);  // Inverter sprite se movendo para a esquerda (inverte quando vel_x for negativo)
} 
else if (vel_y != 0) {
    sprite_index = Spr_run;  // Sprite de movimento vertical
} 
else {
    sprite_index = Spr_player;  // Sprite parado
}


// No evento Step do Obj_player
if (global.vidas <= 0) {
    // Código para reiniciar o jogo, ou exibir a tela de game over
    room_goto(game_over); // Exemplo de reinício
}

// Verifica se o jogador está invulnerável
if (invulneravel) {
    invulneravel_timer -= 1;

    // Faz o jogador piscar alternando a opacidade
    if (invulneravel_timer mod 20 < 5) {
        image_alpha = 0.5;  // Metade visível
    } else {
        image_alpha = 1;  // Totalmente visível
    }

    // Quando o tempo de invulnerabilidade acaba, retorna à condição normal
    if (invulneravel_timer <= 0) {
        invulneravel = false;
        image_alpha = 1;  // Restaura opacidade completa
    }
}