started = 0
set = 0
depth = -1

if instance_exists(obj_timer)
{
	instance_destroy()
}

minutes = 1
seconds = 0
deathsprite = spr_gonk_alsodead
deathsfx = sfx_uhoh
		
state = 0
xs = 0
ys = 0
inv = 0
alph = 0
started_pause = 0
facing = 0

stun_finish = 0

trialmusic = mu_timetrial
secrettrialmusic = mu_escapesecret
timetrial = 0

bopeffect = 0
bop = 0
_time = 0