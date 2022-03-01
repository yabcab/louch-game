visible = is_timetrial

if is_timetrial && !createdplat
{
	createdplat = 1
	with instance_create_depth(x,y,depth,obj_solid)
	{
		image_xscale = other.image_xscale * 4	
		image_yscale = other.image_yscale * 4
	}
}