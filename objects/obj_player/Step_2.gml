if keyboard_check_pressed(vk_escape)
{
	if pause_state != pausestate.playerpause
	{
		previous_pause = pause_state
		pause_state = pausestate.playerpause
	}
	else
	{
		pause_state = previous_pause
		if pause_state = pausestate.playerpause && !instance_exists(obj_hitstun)
			if instance_exists(obj_freezetimer)
				pause_state = pausestate.nonplayerpause
			else
				pause_state = pausestate.none
	}
}

if y > room_height
{
	if state = playerstate.dying
		instance_destroy()
	else
	{
		x = checkpoint_x
		y = checkpoint_y - 1
		audio_play_sound(sfx_fallout,1,0)
		deaths += 1
		state = idlestate
	}
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
if campaign = 4
	sprite_index = spr_bogus
	
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
if vspeed > -3 && state != playerstate.taunt && !justhitenemy
	jumping = 0

while place_meeting(x, y + abs(hspeed) + 1, obj_slope) && !place_meeting(x, y + 1, obj_slope) && !jumping && !dashing && state != playerstate.hurt && state != playerstate.dying
{
	y += 0.1
}