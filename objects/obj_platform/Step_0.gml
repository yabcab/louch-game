if instance_exists(obj_player)
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