var st = obj_player.idlestate

if st != playerstate.high
	sprite_index = spr_shroom2_eaten
else
	sprite_index = spr_shroom2

if pause_state = pausestate.none && instance_exists(obj_player)
	image_speed = 1
else
	image_speed = 0
	
if trialdependant
	visible = is_timetrial