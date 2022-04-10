trialmusic = mu_bigtrial
secrettrialmusic = mu_bigtrial
timetrial = 1
sprite_index = spr_clockface_idle
deathsprite = spr_clockface_dead
bopeffect = 1
deathsfx = sfx_ticking

if operate_on_savedata
{
	ini_open("savedata.lmao")
	if ini_read_real("level_completion",string(level),0) = 0
		instance_destroy()
}
