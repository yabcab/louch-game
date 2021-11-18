if instance_exists(obj_player)
{
	if obj_player.pause != 1
		pause_state = previous
}
else
	pause_state = previous
instance_destroy()