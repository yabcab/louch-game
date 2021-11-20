if key_pause_press && obj_pausemenucontroller.disp_state != 2 && fade = 0 && can_pause && !instance_place(x,y,obj_hallway)
{
	if !pause
	{
		previous_pause = pause_state
		pause_state = pausestate.playerpause
		pause = 1
		audio_stop_sound(sfx_run)
	}
	else
	{
		pause_state = previous_pause
		pause = 0
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
	score -= 250
	if score < 0
		score = 0
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
if campaign = 5
	if state = playerstate.taunt
		sprite_index = spr_coolcate
	else
		sprite_index = spr_cate
	
if jump_charged && pause_state != pausestate.playerpause
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
if vspeed > -3 && state != playerstate.taunt && !justhitenemy && pause_state != pausestate.playerpause
	jumping = 0

while place_meeting(x, y + abs(hspeed) + 1, obj_slope) && !place_meeting(x, y + 1, obj_slope) && !jumping && !dashing && state != playerstate.hurt && state != playerstate.dying
{
	y += 0.1
}

//if using_gamepad && !gamepad_is_connected(0)
//{
//	pause_state = pausestate.playerpause
//	using_gamepad = 0
//}
//using_gamepad = gamepad_is_connected(0)