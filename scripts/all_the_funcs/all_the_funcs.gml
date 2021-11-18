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
	if hitstun_enable
		with instance_create_depth(0,0,0,obj_hitstun)
			alarm[0] = length
}

function do_camerashake(x_int,y_int,__time)
{
	with instance_create_depth(x,y,depth,obj_camerashake)
	{
		x_intensity = x_int
		y_intensity = y_int
		max_time = __time
	}
}

//function pal_swap_set() {
//	shader_set(global.Pal_Shader)
//	var _pal_sprite = argument[0]
//	var _pal_index = argument[1]
//	if (!argument[2])
//	{
//	    var tex = sprite_get_texture(_pal_sprite, 0)
//	    var UVs = sprite_get_uvs(_pal_sprite, 0)
//	    texture_set_stage(global.Pal_Texture, tex)
//	    texture_set_interpolation_ext(global.Pal_Texture, 1)
//	    var texel_x = texture_get_texel_width(tex)
//	    var texel_y = texture_get_texel_height(tex)
//	    var texel_hx = (texel_x * 0.5)
//	    var texel_hy = (texel_y * 0.5)
//	    shader_set_uniform_f(global.Pal_Texel_Size, texel_x, texel_y)
//	    shader_set_uniform_f(global.Pal_UVs, (UVs[0] + texel_hx), (UVs[1] + texel_hy), (UVs[2] + texel_hx), (UVs[3] + texel_hy))
//	    shader_set_uniform_f(global.Pal_Index, _pal_index)
//	}
//	else
//	{
//	    tex = surface_get_texture(_pal_sprite)
//	    texture_set_stage(global.Pal_Texture, tex)
//	    texture_set_interpolation_ext(global.Pal_Texture, 1)
//	    texel_x = texture_get_texel_width(tex)
//	    texel_y = texture_get_texel_height(tex)
//	    texel_hx = (texel_x * 0.5)
//	    texel_hy = (texel_y * 0.5)
//	    shader_set_uniform_f(global.Pal_Texel_Size, texel_x, texel_y)
//	    shader_set_uniform_f(global.Pal_UVs, texel_hx, texel_hy, (1 + texel_hx), (1 + texel_hy))
//	    shader_set_uniform_f(global.Pal_Index, _pal_index)
//	}
//}
	
//function pal_swap_init_system() {
//	global.Pal_Shader = argument[0]
//	global.Pal_Texel_Size = shader_get_uniform(argument[0], "texel_size")
//	global.Pal_UVs = shader_get_uniform(argument[0], "palette_UVs")
//	global.Pal_Index = shader_get_uniform(argument[0], "palette_index")
//	global.Pal_Texture = shader_get_sampler_index(argument[0], "palette_texture")
//	if ((argument_count > 1) && argument[1])
//	    global.Pal_Map = ds_map_create()
//}
	
function metronome_set(beats_per_minute,mu)
{
	with obj_metronome
	{
		bpm = beats_per_minute
		beat_ms = (60000000/(beats_per_minute*4))// / audio_sound_get_pitch(mu)
	}
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
	sprite_index = choose(spr_playerLS_taunt1,spr_playerLS_taunt2,spr_playerLS_taunt3,spr_playerLS_taunt4,spr_playerLS_taunt5,spr_playerLS_taunt6,spr_playerLS_taunt7,spr_playerLS_taunt8)
}

function get_inputs(controllerbind)
{
	
	if instance_exists(obj_hitstun)
	{
		if keyboard_check_pressed(cont_left) || gamepad_button_check_pressed(controllerbind,gp_padl) || (gamepad_axis_value(controllerbind,gp_axislh) < 0 && key_left = 0)
			inputqueue_left = 1
	
		if keyboard_check_pressed(cont_right) || gamepad_button_check_pressed(controllerbind,gp_padr) || (gamepad_axis_value(controllerbind,gp_axislh) > 0 && key_right = 0)
			inputqueue_right = 1
		
		if keyboard_check_pressed(cont_up) || gamepad_button_check_pressed(controllerbind,gp_padu) || (gamepad_axis_value(controllerbind,gp_axislv) < 0 && key_up = 0)
			inputqueue_up = 1
		
		if keyboard_check_pressed(cont_down) || gamepad_button_check_pressed(controllerbind,gp_padd) || (gamepad_axis_value(controllerbind,gp_axislv) > 0 && key_down = 0)
			inputqueue_down = 1
		
		if keyboard_check_pressed(cont_jump) || gamepad_button_check_pressed(controllerbind,gp_face1)
			inputqueue_jump = 1
		
		if keyboard_check_pressed(cont_attack) || gamepad_button_check_pressed(controllerbind,gp_face3)
			inputqueue_attack = 1
		
		if keyboard_check_pressed(cont_taunt) || gamepad_button_check_pressed(controllerbind,gp_face4)
			inputqueue_taunt = 1
	}
	else
	{
		key_left_press = 0
		key_right_press = 0
		key_up_press = 0
		key_down_press = 0
		key_jump_press = 0
		key_attack_press = 0
		key_taunt_press = 0
		key_pause_press = 0
	
		if keyboard_check_pressed(cont_left) || gamepad_button_check_pressed(controllerbind,gp_padl) || (gamepad_axis_value(controllerbind,gp_axislh) < 0 && key_left = 0) || inputqueue_left
			key_left_press = 1
		if keyboard_check(cont_left) || gamepad_button_check(controllerbind,gp_padl) || gamepad_axis_value(controllerbind,gp_axislh) < 0 || inputqueue_left
			key_left = 1
		else
			key_left = 0
	
		if keyboard_check_pressed(cont_right) || gamepad_button_check_pressed(controllerbind,gp_padr) || (gamepad_axis_value(controllerbind,gp_axislh) > 0 && key_right = 0) || inputqueue_right
			key_right_press = 1
		if keyboard_check(cont_right) || gamepad_button_check(controllerbind,gp_padr) || gamepad_axis_value(controllerbind,gp_axislh) > 0 || inputqueue_right
			key_right = 1
		else
			key_right = 0
		
		if keyboard_check_pressed(cont_up) || gamepad_button_check_pressed(controllerbind,gp_padu) || (gamepad_axis_value(controllerbind,gp_axislv) < 0 && key_up = 0) || inputqueue_up
			key_up_press = 1
		if keyboard_check(cont_up) || gamepad_button_check(controllerbind,gp_padu) || gamepad_axis_value(controllerbind,gp_axislv) < 0 || gamepad_button_check(controllerbind,gp_shoulderlb) || gamepad_button_check(controllerbind,gp_shoulderrb) || inputqueue_up
			key_up = 1
		else
			key_up = 0
		
		if keyboard_check_pressed(cont_down) || gamepad_button_check_pressed(controllerbind,gp_padd) || (gamepad_axis_value(controllerbind,gp_axislv) > 0 && key_down = 0) || inputqueue_down
			key_down_press = 1
		if keyboard_check(cont_down) || gamepad_button_check(controllerbind,gp_padd) || gamepad_axis_value(controllerbind,gp_axislv) > 0 || inputqueue_down
			key_down = 1
		else
			key_down = 0
		
		if keyboard_check_pressed(cont_jump) || gamepad_button_check_pressed(controllerbind,gp_face1) || inputqueue_jump
			key_jump_press = 1
		if keyboard_check(cont_jump) || gamepad_button_check(controllerbind,gp_face1) || inputqueue_jump
			key_jump = 1
		else 
			key_jump = 0
		
		if keyboard_check_pressed(cont_attack) || gamepad_button_check_pressed(controllerbind,gp_face3) || inputqueue_attack
			key_attack_press = 1
		if keyboard_check(cont_attack) || gamepad_button_check(controllerbind,gp_face3) || inputqueue_attack
			key_attack = 1
		else
			key_attack = 0
		
		if keyboard_check_pressed(cont_taunt) || gamepad_button_check_pressed(controllerbind,gp_face4) || inputqueue_taunt
			key_taunt_press = 1
		if keyboard_check(cont_taunt) || gamepad_button_check(controllerbind,gp_face4) || inputqueue_taunt
			key_taunt = 1
		else
			key_taunt = 0
	
		if keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(controllerbind,gp_start)
			key_pause_press = 1
		if keyboard_check(vk_escape) || gamepad_button_check(controllerbind,gp_start)
			key_pause = 1
		else
			key_pause = 0
		
		inputqueue_left = 0
		inputqueue_right = 0
		inputqueue_up = 0
		inputqueue_down = 0
		inputqueue_jump = 0
		inputqueue_attack = 0
		inputqueue_taunt = 0
	}
}

#endregion

#region compatability

function texture_set_interpolation_ext(argument0, argument1) {
	gpu_set_texfilter_ext(argument0, argument1)
}

#endregion