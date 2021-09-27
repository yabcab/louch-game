if y > room_height
{
	x = checkpoint_x
	y = checkpoint_y - 1
	audio_play_sound(sfx_fallout,1,0)
	deaths += 1
	state = idlestate
}

if pause_state = pausestate.playerpause
{
	if !started_pause
		pause_player_init()
	else
		pause_player_keep()
}
else
	if started_pause
		pause_player_end()
		
if campaign = 1
	sprite_index = spr_player
if campaign = 2
	sprite_index = spr_player_ls