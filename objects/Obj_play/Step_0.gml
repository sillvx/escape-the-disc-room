// ID do gamepad (normalmente 0 para o primeiro controle conectado)
var gamepad_id = 0;

// Verifica se o botão "Start" foi pressionado
if (gamepad_button_check_pressed(gamepad_id, gp_start)) {
    room_goto_next();  // Troca para a sala do jogo
}
