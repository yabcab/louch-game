if instance_exists(obj_player)
{
	if pause_state != pausestate.nonplayerpause
	{
		image_alpha = 1
		if !instance_exists(obj) && !instance_place(x,y,obj_player)
		{
			obj = instance_create_depth(x,y,depth,obj_solid)
			with obj
			{
				image_xscale = other.image_xscale
				image_yscale = other.image_yscale
			}
		}
	}
	else
	{
		image_alpha = 0.4
		instance_destroy(obj)
	}
}