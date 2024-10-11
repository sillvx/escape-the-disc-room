// Inicialização no evento Create
if (!global.chave_pecas) {
    global.chave_pecas = 0;
}

if (global.chave_pecas == 4) {
    // Alterar o sprite da porta para aberta
    if (instance_exists(Obj_porta)) {
        Obj_porta.sprite_index = Spr_porta_aberta;

        // Verificar se o Obj_prox_fase já foi criado
        if (!instance_exists(Obj_prox_fase)) {
            // Coordenadas exatas da porta
            var porta_x = Obj_porta.x+30;
            var porta_y = Obj_porta.y+25;

            // Centralizar Obj_prox_fase na posição da porta
            var prox_fase_x = porta_x;  // Mesma coordenada X da porta
            var prox_fase_y = porta_y;  // Mesma coordenada Y da porta
            
            // Criar o Obj_prox_fase na mesma posição da porta
            instance_create_layer(prox_fase_x, prox_fase_y, "Instances", Obj_prox_fase);
            
            // Verificação para depuração
            show_debug_message("Obj_prox_fase criado em: " + string(prox_fase_x) + ", " + string(prox_fase_y));
        }
    }
}


// Define o target como o objeto player
target_ = Obj_player;

// Verifica se o alvo (player) existe, caso contrário, interrompe o código
if (!instance_exists(target_)) exit;

// Interpolação suave para seguir o player
x = lerp(x, target_.x, 0.1);
y = lerp(y, target_.y, 0.1);

// Obtém a largura e a altura da visão da câmera
width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);

// Centraliza a câmera na posição do player (sem tremor ainda)
var cam_x = x - width_ / 2;
var cam_y = y - height_ / 2;

// Primeiro, centraliza a câmera na posição do player
camera_set_view_pos(view_camera[0], cam_x, cam_y);

// Agora aplica o tremor de câmera, se estiver ativo
if (shake_duration > 0) {
    var shake_x = irandom_range(-shake_intensity, shake_intensity);  // Tremor horizontal aleatório
    var shake_y = irandom_range(-shake_intensity, shake_intensity);  // Tremor vertical aleatório

    // Adiciona o tremor à câmera já centralizada
    var current_x = camera_get_view_x(view_camera[0]);
    var current_y = camera_get_view_y(view_camera[0]);

    // Atualiza a câmera com o tremor
    camera_set_view_pos(view_camera[0], current_x + shake_x, current_y + shake_y);

    // Reduz a duração do tremor
    shake_duration -= 1;
}
