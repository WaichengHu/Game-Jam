
gpu_set_fog(true, c_orange, 0, 0);

draw_sprite_ext(
    spr,
    img,
    x, y,
    xs, ys,
    ang,
    c_white, 
    image_alpha
);

gpu_set_fog(false, c_white, 0, 0);