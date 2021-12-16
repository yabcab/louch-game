if instance_place(x + hspeed,y,obj_solid) && !instance_place(x + hspeed,y - 12,obj_solid)
{
	while instance_place(x + hspeed,y + vspeed,obj_solid)
		y -= 1
}
if (instance_place(x+hspeed,y,obj_solid)) && (instance_place(x+hspeed,y - 12,obj_solid))
{
	if (hspeed<=0){move_contact_solid(180,abs(hspeed));}
	if (hspeed>0){move_contact_solid(0,abs(hspeed));}
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