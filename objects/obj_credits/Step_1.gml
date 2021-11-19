obj_player.state = -1

if y < -1600
{
	speed = 0
	if obj_player.key_jump_press
	{
		room_goto(rm_title)
		audio_play_sound(sfx_menupick1,1,0)
		obj_player.key_jump = 0	
		obj_player.key_jump_press = 0	
	}
}
else
	if obj_player.key_jump
		vspeed = -2
	else
		vspeed = -0.5