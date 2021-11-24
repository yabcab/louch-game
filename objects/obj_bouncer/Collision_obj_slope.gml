vspeed = 0
if !instance_place(x,y+1,obj_slope)
{
	if (instance_place(x+hspeed,y,obj_solid))
	{
		if (hspeed<=0){move_contact_solid(180,abs(hspeed));}
		if (hspeed>0){move_contact_solid(0,abs(hspeed));}
		if !instance_place(x,y+1,obj_slope)
			hspeed=0;
	}
	if (instance_place(x,y+vspeed,obj_solid))
	{
		if (vspeed<=0){move_contact_solid(90,abs(vspeed));}
		if (vspeed>0){move_contact_solid(270,abs(vspeed));}
		vspeed=0;
	}
	if (instance_place(x+hspeed,y+vspeed,obj_solid))
	{
		hspeed=0;
	}
}
while place_meeting(x + hspeed, y + 0.1, obj_slope)
{
	y -= 0.1
}
if (instance_place(x,y+1,obj_solid) || instance_place(x,y+3,obj_slope))
{
	vspeed = -4
	jumpstart = 1
	image_index = 0
}