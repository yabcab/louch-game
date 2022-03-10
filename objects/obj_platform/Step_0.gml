if instance_exists(obj_player)
{
	if obj_player.grav = 1
	{
		if !instance_exists(obj) && obj_player.bbox_bottom < y
		{
			var s = image_xscale
			obj = instance_create_depth(x,y,depth,obj_solid)
			with obj
				image_xscale = s
		}
		if obj_player.bbox_bottom > y && instance_exists(obj)
			instance_destroy(obj)
	}
	else
	{
		if !instance_exists(obj) && obj_player.y - 31.5 > y + 32
		{
			var s = image_xscale
			obj = instance_create_depth(x,y,depth,obj_solid)
			with obj
				image_xscale = s
		}
		if obj_player.y - 31.5 < y + 32 && instance_exists(obj)
			instance_destroy(obj)
	}
}