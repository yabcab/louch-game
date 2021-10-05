var st = obj_player.idlestate

if pause_state = pausestate.none
{
	image_speed = 1
	if st = playerstate.high
		sprite_index = spr_shroom2
	else
		sprite_index = spr_shroom2_eaten
}
else
	image_speed = 0