if instance_place(x,y+vspeed,obj_slope)
{
	if vspeed > 0
		vspeed *= -1
	vspeed += 1.5
}
if instance_place(x,y-vspeed,obj_slope)
{
	if vspeed > 0
		vspeed *= -1
}
if (instance_place(x,y+vspeed,obj_slope))
{
	if (vspeed<=0){move_contact_solid(90,abs(vspeed));}
	if (vspeed>0){move_contact_solid(270,abs(vspeed));}
	vspeed=0;
}