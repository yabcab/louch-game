obj_music.mu = mu_hub
is_secret = 0
is_trial = 0
if instance_exists(obj_timer)
	instance_destroy(obj_timer)
obj_player.idlestate = playerstate.idle
obj_player.state = playerstate.idle