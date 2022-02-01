if instance_exists(frag[0]) && instance_exists(frag[1]) && instance_exists(frag[2])
{
	instance_destroy(frag[0])
	instance_destroy(frag[1])
	instance_destroy(frag[2])
	
	instance_create_depth(obj_player.x,obj_player.y,depth,obj_specialkey)
}