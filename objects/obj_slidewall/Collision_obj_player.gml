with other
{
	if instance_place(x + hspeed,y - 3,obj_slidewall) && instance_place(x + hspeed,y + 3,obj_slidewall)
	{
		if !inv
		{
			inv = 1
			inv_frames = 1
			invtime = 60
			hp--
		}
		if !hitfromslide
			vspeed = -11
		alarm[1] = 100
		hitfromslide = 1
	}
}
