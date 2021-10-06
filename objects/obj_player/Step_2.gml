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
	
if jump_charged
{
	with instance_create_depth(x + random_range(-16,16),y + random_range(32,48),depth - 1,obj_explosionparticle)
	{
		sprite_index = spr_highjumppart
		speed = 2
		anim_end = 1
	}
	if vspeed > 0
		jump_charged = 0
}
if vspeed > 0
	jumping = 0