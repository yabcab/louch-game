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
		image_speed = 1
		sprite_index = spr_chocopop_walk
		chargetime--
		
		hspeed = lerp(hspeed,-2 * xs,0.1)
		
		if vspeed < 15
			vspeed += 0.3
			
		if (instance_place(x + hspeed,y,obj_solid) && instance_place(x + hspeed,y - 12,obj_solid)) || instance_place(x + hspeed,y,obj_enemyturn) || (instance_place(x + hspeed,y,obj_freezetimewall) && instance_place(x + hspeed,y - 12,obj_freezetimewall))
		{
			hspeed = -hspeed
			xs = -xs
		}
		
		if distance_to_object(obj_player) < 215 && y < obj_player.y + 15 && y > obj_player.y - 15 && chargetime < -60 && obj_player.onground && !instance_place(obj_player.x,obj_player.y,obj_freezetimewall)
		{
			if x > obj_player.x
				xs = 1
			else
				xs = -1
			chargetime = 0
			state = 1
			hspeed = -6 * xs
			lunge = 1
		}
	}
	break;
	
	case 1:
	{
		if lunge
		{
			sprite_index = spr_chocopop_lunge
			image_speed = 1
		}
		else
		{
			sprite_index = spr_chocopop_walk
			image_speed = abs(hspeed) / 2
		}
		
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
	chargetime--
	if !started_pause
		pause_player_init()
	else
		pause_player_keep()
}
else
	if started_pause
		pause_player_end()
		
