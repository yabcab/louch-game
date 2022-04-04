if !is_timetrial
{
	seconds -= 1
	if seconds < 0
	{
		seconds = 59
		minutes -= 1
	}
	alarm[0] = 60	
}
