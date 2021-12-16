switch state {
	case 0: 
	{	
		var hsp, vsp
		
		
		if distance_to_object(obj_player < 350) && obj_player.state = playerstate.swim
		{
			sprite_index = spr_fatfuck_swim
			
			if x < obj_player.x - 64
				hsp = 2.5
			else if x > obj_player.x + 64
				hsp = -2.5
			else
				hsp = 0
			
			if y < obj_player.y - 64
				vsp = 2.5
			else if y > obj_player.y + 64
				vsp = -2.5
			else
				vsp = 0
		}
		else
		{
			hsp = 0
			vsp = 0
			sprite_index = spr_fatfuck_idle
		}
		
		hspeed = lerp(hspeed,hsp,0.025)
		vspeed = lerp(vspeed,vsp,0.025)
		
		rot = direction
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


		