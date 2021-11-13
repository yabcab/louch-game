obj_music.mu = mu_danceparty
is_secret = 0
is_trial = 0

if instance_exists(obj_timer)
	instance_destroy(obj_timer)
if instance_exists(obj_freezetimer)
	instance_destroy(obj_freezetimer)
	
ds_list_destroy(destroy_list)
destroy_list = ds_list_create()

score = 0
obj_hud.display = 1

can_pause = 1