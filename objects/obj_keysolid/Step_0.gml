if instance_exists(obj_player)
{
	if !instance_exists(obj) && obj_player.state != playerstate.keyfly
	{
		obj = instance_create_depth(x,y,depth,obj_solid)
		with obj
		{
			image_xscale = other.image_xscale
			image_yscale = other.image_yscale
			
		}
	}
	if instance_exists(obj) && obj_player.state = playerstate.keyfly
		instance_destroy(obj)
}