// Detecta dano e ativa invulnerabilidade
if (!invulneravel && (place_meeting(x, y, Obj_serra) || place_meeting(x, y, Obj_serra_move) || 
    place_meeting(x, y, Obj_cerra_horizontal) || place_meeting(x, y, Obj_cerra_vertical) || 
    place_meeting(x, y, Obj_serra_move_2) || place_meeting(x, y, Obj_cerra_horizontal_2) || 
    place_meeting(x, y, Obj_cerra_vertical_2))) {
    
    global.vidas -= 1;
    invulneravel = true;
    invulneravel_timer = 60;

    // Ativa o tremor da tela ao tomar dano
    with (Obj_controlador) {
        shake_intensity = 8;
        shake_duration = 20;
    }

    // Se as vidas acabarem
    if (global.vidas <= 0) {
        instance_destroy();
    }
}

// Controle de invulnerabilidade
if (invulneravel) {
    invulneravel_timer -= 1;
    if (invulneravel_timer <= 0) {
        invulneravel = false;
    }
}

// Código de movimentação para teclado e controle
var vel_x = 0;
var vel_y = 0;

// Controle com teclado
if (keyboard_check(ord("D")) || keyboard_check(vk_right)) vel_x = 2;
if (keyboard_check(ord("A")) || keyboard_check(vk_left)) vel_x = -2;
if (keyboard_check(ord("W")) || keyboard_check(vk_up)) vel_y = -2;
if (keyboard_check(ord("S")) || keyboard_check(vk_down)) vel_y = 2;

// Controle com gamepad
var gamepad_id = 0;  // ID do gamepad (normalmente 0 para o primeiro controle)

// Verifica o movimento no D-Pad
if (gamepad_button_check(gamepad_id, gp_padr)) vel_x = 2;
if (gamepad_button_check(gamepad_id, gp_padl)) vel_x = -2;
if (gamepad_button_check(gamepad_id, gp_padu)) vel_y = -2;
if (gamepad_button_check(gamepad_id, gp_padd)) vel_y = 2;

// Verifica o movimento no eixo X (analógico esquerdo horizontal)
if (abs(gamepad_axis_value(gamepad_id, gp_axislh)) > 0.1) {
    vel_x = 2 * sign(gamepad_axis_value(gamepad_id, gp_axislh));
}

// Verifica o movimento no eixo Y (analógico esquerdo vertical)
if (abs(gamepad_axis_value(gamepad_id, gp_axislv)) > 0.1) {
    vel_y = 2 * sign(gamepad_axis_value(gamepad_id, gp_axislv));
}

// Colisão horizontal
if (!place_meeting(x + vel_x, y, Obj_parede)) {
    x += vel_x;
}

// Colisão vertical
if (!place_meeting(x, y + vel_y, Obj_parede)) {
    y += vel_y;
}

// Troca de sprites baseada no movimento
if (vel_x != 0) {
    sprite_index = Spr_run;
    image_xscale = sign(vel_x);
} 
else if (vel_y != 0) {
    sprite_index = Spr_run;
} 
else {
    sprite_index = Spr_player;
}

// Reinicia o jogo se as vidas acabarem
if (global.vidas <= 0) {
    room_goto(game_over);
}

// Efeito de piscar enquanto invulnerável
if (invulneravel) {
    invulneravel_timer -= 1;

    if (invulneravel_timer mod 20 < 5) {
        image_alpha = 0.5;
    } else {
        image_alpha = 1;
    }

    if (invulneravel_timer <= 0) {
        invulneravel = false;
        image_alpha = 1;
    }
}
