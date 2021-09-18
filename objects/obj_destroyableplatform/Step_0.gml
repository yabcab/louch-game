if instance_exists(obj_player)
{
	if active
	{
		if !instance_exists(obj)
		{
			var s = image_xscale
			obj = instance_create_depth(x,y,depth,obj_platform)
			with obj
				image_xscale = s
		}
	}
	else
		if instance_exists(obj)
			instance_destroy(obj)

	if instance_place(x + 8,y - 32,obj_player) && !set
	{
		alarm[0] = 60
		set = 1
	}
}