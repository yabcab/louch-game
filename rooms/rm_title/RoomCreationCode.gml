obj_player.state = -1
obj_shaders.drunk = 0
if instance_exists(obj_timer)
	instance_destroy(obj_timer)
if instance_exists(obj_freezetimer)
	instance_destroy(obj_freezetimer)
if instance_exists(obj_console)
	instance_destroy(obj_console)
	
obj_music.mu = mu_title
obj_hud.display = 0

can_pause = 0
debug = 0