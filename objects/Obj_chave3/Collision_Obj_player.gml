// Evento de colisão com o jogador em Obj_chave, Obj_chave2, Obj_chave3, Obj_chave4
if (other.object_index == Obj_player) {
    global.chave_pecas += 1;
    instance_destroy(); // Destroi a chave após a coleta
}
