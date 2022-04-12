if instance_place(x,y,obj_player)
{
	score_off = lerp(score_off,0,0.075)
	score_alpha = lerp(score_alpha,1,0.075)
}
else
{
	score_off = lerp(score_off,20,0.075)
	score_alpha = lerp(score_alpha,0,0.075)
}

if pause_state = pausestate.none
{
	_time1++
	_time2++
	_time3++
	_time4++
	_time5++
	
	sin1 = sin(_time1 / 25) * 3
	sin2 = sin(_time2 / 25) * 3
	sin3 = sin(_time3 / 25) * 3
	sin4 = sin(_time4 / 25) * 3
	sin5 = sin(_time5 / 25) * 3
}
