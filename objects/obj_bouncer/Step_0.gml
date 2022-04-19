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
		if jumpstart
			sprite_index = spr_margarita_bounce
		else
			sprite_index = spr_margarita_idle
		
		hspeed = -2.5 * xs
		
		if vspeed < 15
			vspeed += 0.3
			
		if (instance_place(x + hspeed,y,obj_solid) && instance_place(x + hspeed,y - 12,obj_solid)) || instance_place(x + hspeed,y,obj_enemyturn) || (instance_place(x + hspeed,y,obj_freezetimewall) && instance_place(x + hspeed,y - 12,obj_freezetimewall))
		{
			hspeed = -hspeed
			xs = -xs
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
		
