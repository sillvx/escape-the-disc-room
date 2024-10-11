// Evento de colisão com o jogador no Obj_prox_fase
if (other.object_index == Obj_player) {
    // Reseta a contagem das chaves
    global.chave_pecas = 0;

    // Transição para a próxima fase (substitua 'nome_da_proxima_fase' pelo nome da próxima sala)
    room_goto_next();
}
