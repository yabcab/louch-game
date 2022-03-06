switch state {
	case 0: 
	{	
		_time++
		var dist = x - obj_player.x
		if dist != 0
			xs = -(sign(dist))
		
		ysin = sin(_time / 20) * 3
		if onscreen && xs = obj_player.facing
		{
			speed = 1.5
			sprite_index = spr_eye_idle	
			xoff = 0
			yoff = 0
		}
		else
		{
			speed = 0
			sprite_index = spr_eye_fear
			xoff = random_range(-1,1)
			yoff = random_range(-1,1)
		}
		
		direction = point_direction(x,y,obj_player.x,obj_player.y)
		
		//if instance_place(x,y + vspeed,obj_solid) || instance_place(x + hspeed,y,obj_slope) || (instance_place(x,y + vspeed,obj_platform) && vspeed > 0)
		//	vspeed = -vspeed

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
		