if (instance_place(x,y + vspeed,obj_cartrailslope))
{
	if (vspeed<=0){move_contact_solid(90,abs(vspeed));}
	if (vspeed>0){move_contact_solid(270,abs(vspeed));}
	vspeed=0;
}
while place_meeting(x + hspeed, y, obj_cartrailslope)
{
	y -= 0.1
}