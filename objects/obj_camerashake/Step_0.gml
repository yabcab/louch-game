camera_set_view_pos(cam,following.x + random_range(-x_intensity,x_intensity),y + random_range(-y_intensity,y_intensity))
_time++
if _time > max_time
	instance_destroy()