visible = is_timetrial

if is_timetrial && !createdplat
{
	createdplat = 1
	with instance_create_depth(x,y,depth,obj_platform)
	{
		image_xscale = other.image_xscale	
	}
}