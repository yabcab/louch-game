obj_music.mu = mu_hub
obj_camera.camboby = 0
obj_ambience.playambience = 0
is_secret = 0
is_trial = 0
is_timetrial = 0
keys = 0
crowncollects = 0
rank_highestcombo = 0

if instance_exists(obj_timer)
	instance_destroy(obj_timer)
if instance_exists(obj_freezetimer)
	instance_destroy(obj_freezetimer)
while instance_exists(obj_key)
	instance_destroy(obj_key)
	while instance_exists(obj_keyfrag)
	instance_destroy(obj_keyfrag)
	
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
audio_stop_sound(mu_bigtrial)
audio_stop_sound(mu_gauntlet)
audio_stop_sound(mu_escapesecret)

crownsseen = 0
var i;
for (i = 0; i < 99; i++)
	crownarray[i] = 0
ini_open("savedata.lmao")
totalcrowns = ini_read_real("stats","totalcrowns",0)

obj_player.live_enter = 0
