if !trialdependant || (trialdependant && is_timetrial)
{
	visible = 1
	var st = obj_player.idlestate

	if st != playerstate.high
		sprite_index = spr_shroom1
	else
		sprite_index = spr_shroom1_eaten

	if pause_state = pausestate.none && instance_exists(obj_player)
		image_speed = 1
	else
		image_speed = 0
}
else
	visible = 0