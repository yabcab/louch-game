if distance_to_object(obj_player) < 3
{
	if instance_exists(obj_specialkey)
	{
		instance_destroy(obj_specialkey)
		instance_destroy()
		obj_player.dashing = 0
		obj_player.dash_charge = 1
	}
}