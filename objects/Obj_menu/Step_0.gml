// ID do gamepad (normalmente 0 para o primeiro controle conectado)
var gamepad_id = 0;

// Verifica se o botão "select/back" foi pressionado
if (gamepad_button_check_pressed(gamepad_id, gp_select)) {
    game_restart();  // reinicia o jogo
}
