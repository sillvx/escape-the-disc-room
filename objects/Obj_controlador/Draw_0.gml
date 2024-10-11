if (global.chave_pecas == 4 && room_get_name(room) != "game_over") {
    // Obtém a posição da câmera (visor 0)
    var view_x = camera_get_view_x(view_camera[0]);
    var view_y = camera_get_view_y(view_camera[0]);

    // Desenha o sprite no canto superior esquerdo do visor 0
    draw_sprite(Spr_chave_image, 0, view_x, view_y);
}



