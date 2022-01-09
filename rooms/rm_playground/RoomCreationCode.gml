obj_music.mu = mu_playground
is_secret = 0
is_trial = 0
keys = 0

if instance_exists(obj_timer)
	instance_destroy(obj_timer)
if instance_exists(obj_freezetimer)
	instance_destroy(obj_freezetimer)
while instance_exists(obj_key)
	instance_destroy(obj_key)
	
ds_list_destroy(destroy_list)
destroy_list = ds_list_create()

health = 7
score = 0
obj_hud.display = 1

can_pause = 1
obj_player.state = 0
obj_player.idlestate = 0
obj_player.statesave = 0
obj_player.nonstunstate = 0
obj_player.hp = 7
obj_player.vspeed = 0
obj_player.rot = 0

audio_stop_sound(mu_timetrial)
audio_stop_sound(mu_escapesecret)

level = level_id.none