switch state {
	case 0: 
	{	
		if instance_place(x + hspeed,y,obj_solid) || instance_place(x + hspeed,y,obj_slope) || (instance_place(x + hspeed,y,obj_freezetimewall) && instance_place(x + hspeed,y - 12,obj_freezetimewall))
			hspeed = -hspeed

		if hspeed != 0
			xs = -sign(hspeed)
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
		