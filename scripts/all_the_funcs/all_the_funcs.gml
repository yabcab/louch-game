#region pause functions
function pause_player_init() {
	started_pause = 1
	p_spr = sprite_index
	p_hsp = hspeed
	p_vsp = vspeed
	p_state = state
	p_frame = image_index
	p_facing = facing
	
	image_speed = 0
	speed = 0
}

function pause_player_keep() {
	sprite_index = p_spr
	image_index = p_frame
	hspeed = 0
	vspeed = 0
	state = playerstate.none
	facing = p_facing
	inv = 1
	alph = 1
	alarm[1] += 1
}

function pause_player_end() {
	started_pause = 0
	image_speed = 1
	image_index = p_frame
	hspeed = p_hsp
	vspeed = p_vsp
	image_speed = 1
	state = p_state
	if alarm[1] <= 0
	{
		inv = 0
		alph = 1
	}
}
#endregion

#region misc - if you need it it's here
function do_hitstun(length)
{
	with instance_create_depth(0,0,0,obj_hitstun)
		alarm[0] = length
}

#endregion

#region player - you get the point

function player_taunt()
{
	audio_play_sound(sfx_taunt,1,0)
	hspeedsave = hspeed
	vspeedsave = vspeed
	statesave = state
	state = playerstate.taunt
	sprite_index = choose(spr_playerLS_taunt1,spr_playerLS_taunt2,spr_playerLS_taunt3,spr_playerLS_taunt4,spr_playerLS_taunt5)
}

#endregion