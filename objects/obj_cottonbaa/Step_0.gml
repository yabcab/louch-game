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
		sprite_index = spr_cottonbaa_sleep
		
		hspeed = 0
		
		if vspeed < 15
			vspeed += 0.3
			
		if (instance_place(x + hspeed,y,obj_solid) && instance_place(x + hspeed,y - 12,obj_solid)) || instance_place(x + hspeed,y,obj_enemyturn) || (instance_place(x + hspeed,y,obj_freezetimewall) && instance_place(x + hspeed,y - 12,obj_freezetimewall))
		{
			hspeed = -hspeed
			xs = -xs
		}
		wait = 0
	}
	break;
	
	case 1:
	{
		sprite_index = spr_cottonbaa_waking
		
		if vspeed < 15
			vspeed += 0.3
		hspeed = 0
		wait++
		if wait > 25
			state = 2
	}
	break;
	
	case 2: 
	{
		sprite_index = spr_cottonbaa_run
		
		hspeed = 5 * xs
		
		if vspeed < 15
			vspeed += 0.3
			
		if (instance_place(x + hspeed,y,obj_solid) && instance_place(x + hspeed,y - 12,obj_solid)) || instance_place(x + hspeed,y,obj_enemyturn)
		{
			hspeed = -hspeed
			xs = -xs
		}
		wait = 0
		
		with instance_create_depth(x,y,depth + 1,obj_trail)
		{
			image_speed = 0
			startfade = 1
			sprite_index = other.sprite_index
			image_index = other.image_index
			image_xscale = other.xs
			image_angle = other.image_angle
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
		
