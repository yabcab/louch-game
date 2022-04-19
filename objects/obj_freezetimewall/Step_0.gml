if instance_exists(obj_player)
{
	if pause_state != pausestate.nonplayerpause && pause_state != pausestate.playerpause
	{
		mask_index = spr_wall
		image_alpha = 1
		if !instance_exists(obj) && distance_to_object(obj_player) > 5
		{
			obj = instance_create_depth(x,y,depth,obj_solid)
			with obj
			{
				image_xscale = other.image_xscale
				image_yscale = other.image_yscale
			}
		}
	}
	else if pause_state != pausestate.playerpause
	{
		mask_index = spr_null
		image_alpha = 0.4
		instance_destroy(obj)
	}
}
