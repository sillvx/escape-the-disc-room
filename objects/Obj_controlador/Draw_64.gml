// Evento Draw GUI no Obj_controlador (ou outro objeto que gerencia a HUD)

// Verifica se o nome da room não é "fim"
if (room_get_name(room) != "fim") {
    // Tamanho de escala dos corações (exemplo: 2x maior)
    var escala = 2;

    // Posição X inicial mais à direita (exemplo: começando no pixel 100)
    var posicao_x_inicial = 100;

    // Desenhar os corações na interface (GUI)
    for (var i = 0; i < global.vidas; i++) {
        if (i < global.vidas) {
            // Coração cheio com escala, ajustado mais para a direita
            draw_sprite_ext(spr_vida, 0, posicao_x_inicial + i * (40 * escala), 32, escala, escala, 0, c_white, 1);
        } else {
            // Coração vazio com escala, ajustado mais para a direita
            draw_sprite_ext(Spr_sem_vida, 0, posicao_x_inicial + i * (40 * escala), 32, escala, escala, 0, c_white, 1);
        }
    }
}
