if camera_get_view_target(view_camera[0]) = obj_player
	camera_set_view_target(view_camera[0],self)
oldtarget = camera_get_view_target(view_camera[0])
newroom = true
_time = 0