if pause_state = pausestate.playerpause
	alarm[0]++
	
image_xscale = lerp(image_xscale,1,0.15)
image_yscale = lerp(image_yscale,1,0.15)

if is_timetrial && pause_state != pausestate.playerpause
{
	trial_timeleft -= 0.075
	trial_disptarget = lerp(trial_disptarget,trial_timeleft,0.1)
}
