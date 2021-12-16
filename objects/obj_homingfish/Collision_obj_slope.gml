if (instance_place(x,y + vspeed,obj_slope))
{
	if (vspeed<=0){move_contact_solid(90,abs(vspeed));}
	if (vspeed>0){move_contact_solid(270,abs(vspeed));}
	vspeed=0;
}
if place_meeting(x + hspeed,y - 1,obj_solid) && place_meeting(x + hspeed,y - 13,obj_solid)
{
	if (hspeed<=0){move_contact_solid(180,abs(hspeed));}
	if (hspeed>0){move_contact_solid(0,abs(hspeed));}
	hspeed=0;
}
while place_meeting(x + hspeed, y, obj_slope)
{
	y -= 0.1
}