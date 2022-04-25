var cam = view_camera[0]
var camx = camera_get_view_x(cam)
var camy = camera_get_view_y(cam)
if ignore_zoom
	draw_sprite_tiled_ext(sprite_index,image_index,(camx * x_intensity) + x_scroll_val + x_off,(camy * y_intensity) + y_scroll_val + y_off,size * (obj_camera.zoomx / 640),size * (obj_camera.zoomy / 360),image_blend,alpha)
else
	draw_sprite_tiled_ext(sprite_index,image_index,(camx * x_intensity) + x_scroll_val + x_off,(camy * y_intensity) + y_scroll_val + y_off,size,size,image_blend,alpha)
