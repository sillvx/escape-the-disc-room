// Define o target como o objeto player
target_ = Obj_player;

// Obtém a largura e a altura da visão da câmera
width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);

// Verifica se o alvo (player) existe, caso contrário, interrompe o código
if (!instance_exists(target_)) exit;

// Interpolação suave para seguir o player
x = lerp(x, target_.x, 0.1);
y = lerp(y, target_.y, 0.1);

// Centraliza a câmera na posição do player
camera_set_view_pos(view_camera[0], x - width_/2, y - height_/2);
