var cam = view_camera[0]
var camx = camera_get_view_x(cam)
var camy = camera_get_view_y(cam)
draw_sprite_tiled_ext(sprite_index,image_index,(camx * x_intensity) + x_scroll_val + x_off,(camy * y_intensity) + y_scroll_val + y_off,size,size,c_white,alpha)