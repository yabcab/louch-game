if vspeed < 15
	vspeed += 0.1

onground = instance_place(x,y+1,obj_terriginoexculsivesolid)

if dead = 1
{
	vspeed += 0.1
	image_angle += 5 * obj_player.facing
}

switch state {
	case nolanstate.idle_at_place:
	{
		var distance = abs(x - goodbye_x)
		
		if distance > 5 
		{
			if x < goodbye_x
				hspeed = 3
			else if x > goodbye_x
				hspeed = -3
			else
				hspeed = 0
				
			if onground
				vspeed = -1
		}
		else
			hspeed = 0
	}
	break;
	
	case nolanstate.runaround: {
		hspeed = 3 * facing
		
		if onground
			vspeed = -1
	}
	break;
}