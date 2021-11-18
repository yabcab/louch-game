obj_player.state = -1

if y < -1600
{
	speed = 0
	if obj_player.key_jump_press
		room_goto(rm_title)
}
else
	if obj_player.key_jump
	{
		vspeed = -2
		obj_player.key_jump = 0	
		obj_player.key_jump_press = 0	
	}
	else
		vspeed = -0.5