switch state {
	case 0: 
	{
		if vspeed < 15
			vspeed += 0.3
			
		if instance_place(x + hspeed,y,obj_solid)
		{
			hspeed = -hspeed
			xs = -xs
		}
		
		if instance_exists(obj_player)
		{
			if x > obj_player.x
			{
				hspeed -= 0.15
				xs = 1
			}
			else
			{
				hspeed += 0.15
				xs = -1
			}
		}
		else
			hspeed = lerp(hspeed,5 * -xs,0.05)

		hspeed = clamp(hspeed,-5,5)
	}
	break;
}

var s = sprite_index
var _xs = xs
var i = image_index
with instance_create_depth(x,y,depth + 1,obj_trail)
{
	image_speed = 0
	startfade = 1
	sprite_index = s
	image_index = i
	image_xscale = _xs
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