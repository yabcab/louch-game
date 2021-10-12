camera_set_view_target(cam,following_new)
x = following.x + random_range(-x_intensity,x_intensity)
y = following.y + random_range(-y_intensity,y_intensity)
_time++
if _time > max_time
	instance_destroy()