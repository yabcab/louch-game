if instance_place(x,y,obj_discowall)
{
	if hspeed != 0
	{
		while instance_place(x + hspeed,y,obj_discowall)
			x -= sign(hspeed)
		hspeed = 0
	}
	if vspeed != 0
	{
		while instance_place(x,y + vspeed,obj_discowall)
			y -= sign(vspeed)
		vspeed = 0	
	}
}
	

