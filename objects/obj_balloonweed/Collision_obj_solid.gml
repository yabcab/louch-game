if instance_place(x + hspeed,y,obj_solid) && !instance_place(x + hspeed,y - 12,obj_solid)
{
	while instance_place(x + hspeed,y + vspeed,obj_solid)
		y -= 1
}
if (!place_free(x+hspeed,y))
{
    if (hspeed<=0){move_contact_solid(180,abs(hspeed));}
    if (hspeed>0){move_contact_solid(0,abs(hspeed));}
    hspeed=0;
}
if (!place_free(x,y+vspeed))
{
    if (vspeed<=0){move_contact_solid(90,abs(vspeed));}
    if (vspeed>0){move_contact_solid(270,abs(vspeed));}
    vspeed=0;
}
if (!place_free(x+hspeed,y+vspeed))
{
    hspeed=0;
}
//if (instance_place(x + xs + hspeed * 5,y,obj_solid) && instance_place(x + xs + hspeed * 5,y - 12,obj_solid)) && instance_place(x,y+3,obj_solid)
//{
//	hspeed *= -1
//	x -= sign(hspeed) * 5
//}
//if (instance_place(x,y + vspeed * 5,obj_solid) && instance_place(x + xs + hspeed * 5,y - 12,obj_solid)) && instance_place(x,y+3,obj_solid)
//{
//	vspeed *= -1
//	y -= sign(vspeed) * 5
//}