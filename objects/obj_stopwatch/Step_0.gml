if !trialdependant || is_timetrial
{
	visible = 1
	if pause_state = pausestate.none
	_time++
	bop = sin(_time / 10) * 3
}
else
	visible = 0