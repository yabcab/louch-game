while place_meeting(x + hspeed, y + 0.1, obj_slope)
{
	y -= 0.1
}
while place_meeting(x, y + abs(hspeed) + 1, obj_slope) && !place_meeting(x, y + 1, obj_slope)
{
	y += 0.1
}

switch state {
	case 0: 
	{
		hspeed = -2 * xs
		player_velocity()
		enemy_wallcheck()
	}
	break;
}

if pause_state != pausestate.none
{
	if !started_pause
		pause_player_init()
	else
		pause_player_keep()
}
else
	if started_pause
		pause_player_end()
		
