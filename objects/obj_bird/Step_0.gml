switch state {
	case 0: 
	{	
		if instance_place(x + hspeed,y,obj_solid) || instance_place(x + hspeed,y,obj_slope) || (instance_place(x + hspeed,y,obj_freezetimewall) && instance_place(x + hspeed,y - 12,obj_freezetimewall))
			hspeed = -hspeed

		if hspeed != 0
			xs = sign(hspeed)
		
		_time++
		y += sin(_time / 20)
		
		if can_egg && onscreen
		{
			alarm[0] = random_range(300,450)
			instance_create_depth(x,y,depth,obj_egg)
			can_egg = 0
			audio_play_sound(sfx_pop,1,0)
		}
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
		