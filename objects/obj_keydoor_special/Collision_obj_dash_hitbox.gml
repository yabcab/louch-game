if keys > 0
{
	instance_destroy()
	keys -= 1
	obj_player.dashing = 0
	obj_player.dash_charge = 1
}