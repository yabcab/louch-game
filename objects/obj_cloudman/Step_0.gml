switch state {
	case 0: 
	{	
		if instance_place(x,y + vspeed,obj_solid) || instance_place(x,y + vspeed,obj_slope) || (instance_place(x,y + vspeed,obj_platform) && vspeed > 0)
			vspeed = -vspeed

		//if vspeed != 0
		//	ys = -sign(vspeed)
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
		