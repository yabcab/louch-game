if instance_exists(obj_player)
{
	if pause_state = pausestate.nonplayerpause
	{
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
		instance_destroy(obj)
}