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
		hspeed = 0
		
		if vspeed < 15
			vspeed += 0.3
			
		if (instance_place(x + hspeed,y,obj_solid) && instance_place(x + hspeed,y - 12,obj_solid)) || instance_place(x + hspeed,y,obj_enemyturn)
		{
			hspeed = -hspeed
			xs = -xs
		}
		wait = 0
		sprite_index = spr_bella_idle
	}
	break;
	
	case 1:
	{
		if vspeed < 15
			vspeed += 0.3
		hspeed = 0
		wait++
		if wait > 25
			state = 2
		sprite_index = spr_bella_hit
	}
	break;
	
	case 2: 
	{
		hspeed = 4 * -xs
		
		if vspeed < 15
			vspeed += 0.3
			
		if (instance_place(x + hspeed,y,obj_solid) && instance_place(x + hspeed,y - 12,obj_solid)) || instance_place(x + hspeed,y,obj_enemyturn)
		{
			hspeed = -hspeed
			xs = -xs
		}
		wait = 0
		sprite_index = spr_bella_idle
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
		
