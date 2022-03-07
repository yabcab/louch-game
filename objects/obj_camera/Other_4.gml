if camera_get_view_target(view_camera[0]) = obj_player
	camera_set_view_target(view_camera[0],self)
	
x = obj_player.x + (obj_player.facing * 20)
xx = obj_player.x + (obj_player.facing * 20)
y = obj_player.y

_time = 0