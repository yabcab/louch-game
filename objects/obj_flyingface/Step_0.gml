switch state {
	case 0: 
	{	
		var dist = x - obj_player.x
		if dist != 0
			xs = sign(dist)
		
		if onscreen && xs != obj_player.facing
			speed = 1.5
		else
			speed = 0
		
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
		