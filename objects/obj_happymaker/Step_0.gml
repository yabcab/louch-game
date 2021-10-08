if instance_exists(obj_player)
	var st = obj_player.idlestate

if pause_state = pausestate.none && instance_exists(obj_player)
{
	image_speed = 1
	if st != playerstate.high
		sprite_index = spr_shroom1
	else
		sprite_index = spr_shroom1_eaten
}
else
	image_speed = 0