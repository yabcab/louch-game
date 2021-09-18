var cam = view_camera[0]
var camx = camera_get_view_x(cam)
var camy = camera_get_view_y(cam)
draw_sprite_ext(sprite_index,image_index,(((x + camx) / 2) * x_intensity) + x_scroll_val + x_off,(((y + camy) / 2) * y_intensity) + y_scroll_val + y_off,x_size,y_size,0,c_white,alpha)