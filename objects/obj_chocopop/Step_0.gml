switch state {
	case 0: 
	{
		chargetime--
		
		hspeed = lerp(hspeed,-2 * xs,0.1)
		
		if vspeed < 15
			vspeed += 0.3
			
		if instance_place(x + hspeed,y,obj_solid) || instance_place(x + hspeed,y,obj_enemyturn)
		{
			hspeed = -hspeed
			xs = -xs
		}
		
		if distance_to_object(obj_player) < 215 && y < obj_player.y + 15 && y > obj_player.y - 15 && chargetime < -60
		{
			if x > obj_player.x
				xs = 1
			else
				xs = -1
			chargetime = 0
			state = 1
			hspeed = -6 * xs
		}
	}
	break;
	
	case 1:
	{
		chargetime++
		
		if instance_place(x + hspeed,y,obj_solid) || instance_place(x + hspeed,y,obj_enemyturn)
		{
			hspeed = -hspeed
			xs = -xs
		}
		
		if chargetime > 20
			state = 0

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