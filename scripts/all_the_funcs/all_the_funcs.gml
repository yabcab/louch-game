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
	with obj_camera
	{
		shake_x_int = x_int
		shake_y_int = y_int
		alarm[0] = __time
		camerashake = 1
	}
}

function do_zoomfx(intensity,do_target)
{
	with obj_camera {
		if do_target
		{
			zoomx_target = 640 + (intensity * 16)
			zoomy_target = 360 + (intensity * 9)
		}
		else
		{
			zoomx = 640 + (intensity * 16)
			zoomy = 360 + (intensity * 9)
		}
	}
}

function draw_text_outlined(xx,yy,outline_col,string_col,str,xs,ys){
    //draw_text_outlined(x, y, outline color, string color, string)   
  
    //Outline  
    draw_set_color(outline_col);  
   // draw_text_transformed(xx+1, yy+1, str,xs,ys,0);  
  //  draw_text_transformed(xx-1, yy-1, str,xs,ys,0);    
    draw_text_transformed(xx,   yy+(1*ys), str,xs,ys,0);    
    draw_text_transformed(xx+(1*xs),   yy, str,xs,ys,0);   
    draw_text_transformed(xx,   yy-(1*ys), str,xs,ys,0);   
    draw_text_transformed(xx-(1*xs),   yy, str,xs,ys,0);    
   // draw_text_transformed(xx-1, yy+1, str,xs,ys,0);   
   // draw_text_transformed(xx+1, yy-1, str,xs,ys,0);    
  
    //Text  
    draw_set_color(string_col);  
    draw_text_transformed(xx, yy, str,xs,ys,0);
}

function pal_swap_set() {
	shader_set(global.Pal_Shader)
	var _pal_sprite = argument[0]
	var _pal_index = argument[1]
	if (!argument[2])
	{
	    var tex = sprite_get_texture(_pal_sprite, 0)
	    var UVs = sprite_get_uvs(_pal_sprite, 0)
	    texture_set_stage(global.Pal_Texture, tex)
	    texture_set_interpolation_ext(global.Pal_Texture, 1)
	    var texel_x = texture_get_texel_width(tex)
	    var texel_y = texture_get_texel_height(tex)
	    var texel_hx = (texel_x * 0.5)
	    var texel_hy = (texel_y * 0.5)
	    shader_set_uniform_f(global.Pal_Texel_Size, texel_x, texel_y)
	    shader_set_uniform_f(global.Pal_UVs, (UVs[0] + texel_hx), (UVs[1] + texel_hy), (UVs[2] + texel_hx), (UVs[3] + texel_hy))
	    shader_set_uniform_f(global.Pal_Index, _pal_index)
	}
	else
	{
	    tex = surface_get_texture(_pal_sprite)
	    texture_set_stage(global.Pal_Texture, tex)
	    texture_set_interpolation_ext(global.Pal_Texture, 1)
	    texel_x = texture_get_texel_width(tex)
	    texel_y = texture_get_texel_height(tex)
	    texel_hx = (texel_x * 0.5)
	    texel_hy = (texel_y * 0.5)
	    shader_set_uniform_f(global.Pal_Texel_Size, texel_x, texel_y)
	    shader_set_uniform_f(global.Pal_UVs, texel_hx, texel_hy, (1 + texel_hx), (1 + texel_hy))
	    shader_set_uniform_f(global.Pal_Index, _pal_index)
	}
}
	
function pal_swap_init_system() {
	global.Pal_Shader = argument[0]
	global.Pal_Texel_Size = shader_get_uniform(argument[0], "texel_size")
	global.Pal_UVs = shader_get_uniform(argument[0], "palette_UVs")
	global.Pal_Index = shader_get_uniform(argument[0], "palette_index")
	global.Pal_Texture = shader_get_sampler_index(argument[0], "palette_texture")
	if ((argument_count > 1) && argument[1])
	    global.Pal_Map = ds_map_create()
}
	
function get_control_string(cont)
{
	switch cont
	{
		default: { return "[unknown]" } break;
		case vk_escape: { return "Escape" } break; 
		case vk_f1: { return "F1" } break; 	
		case vk_f2: { return "F2" } break; 
		case vk_f3: { return "F3" } break; 
		case vk_f4: { return "F4" } break; 
		case vk_f5: { return "F5" } break; 
		case vk_f6: { return "F6" } break; 
		case vk_f7: { return "F7" } break; 
		case vk_f8: { return "F8" } break; 
		case vk_f9: { return "F9" } break; 
		case vk_f10: { return "F10" } break; 
		case vk_f11: { return "F11" } break; 
		case vk_f12: { return "F12" } break; 
		case vk_printscreen: { return "Print Screen" } break; 
		case vk_pause: { return "Pause" } break; 
//		case ord("`"): { return "[`]" } break; 
		case ord("1"): { return "[1]" } break; 
		case ord("2"): { return "[2]" } break; 
		case ord("3"): { return "[3]" } break; 
		case ord("4"): { return "[4]" } break; 
		case ord("5"): { return "[5]" } break; 
		case ord("6"): { return "[6]" } break; 
		case ord("7"): { return "[7]" } break; 
		case ord("8"): { return "[8]" } break; 
		case ord("9"): { return "[9]" } break; 
		case ord("0"): { return "[0]" } break; 
//		case ord("-"): { return "[-]" } break; 
//		case ord("="): { return "[=]" } break; 
		case vk_backspace: { return "Backspace" } break; 
		case vk_insert: { return "Insert" } break; 
		case vk_home: { return "Home" } break; 
		case vk_pageup: { return "Page Up" } break; 
//		case ord("/"): { return "[/]" } break; 
//		case ord("*"): { return "[*]" } break; 
		//case ord("-"): { return "[-]" } break; 
		case vk_tab: { return "Tab" } break; 
		case ord("Q"): { return "Q" } break; 
		case ord("W"): { return "W" } break; 
		case ord("E"): { return "E" } break; 
		case ord("R"): { return "R" } break; 
		case ord("T"): { return "T" } break; 
		case ord("Y"): { return "Y" } break; 
		case ord("U"): { return "U" } break; 
		case ord("I"): { return "I" } break; 
		case ord("O"): { return "O" } break; 
		case ord("P"): { return "P" } break; 
//		case ord("["): { return "[" } break; 
//		case ord("]"): { return "]" } break; 
//		case ord("\\"): { return "\\" } break;
//		case vk_delete: { return "Delete" } break; 
		case vk_end: { return "End" } break; 
		case vk_pagedown: { return "Page Down" } break; 
		case vk_numpad7: { return "Num 7" } break; 
		case vk_numpad8: { return "Num 8" } break; 
		case vk_numpad9: { return "Num 9" } break; 
		case ord("+"): { return "[+]" } break; 
		case ord("A"): { return "A" } break;
		case ord("S"): { return "S" } break; 
		case ord("D"): { return "D" } break; 
		case ord("F"): { return "F" } break; 
		case ord("G"): { return "G" } break; 
		case ord("H"): { return "H" } break; 
		case ord("J"): { return "J" } break; 
		case ord("K"): { return "K" } break; 
		case ord("L"): { return "L" } break; 
//		case ord(";"): { return "[;]" } break; 
//		case ord("'"): { return "[']" } break; 
		case vk_enter: { return "Enter" } break; 
		case vk_numpad4: { return "Num 4" } break; 
		case vk_numpad5: { return "Num 5" } break; 
		case vk_numpad6: { return "Num 6" } break; 
		case vk_shift: { return "Shift" } break; 
		case ord("Z"): { return "Z" } break;
		case ord("X"): { return "X" } break;
		case ord("C"): { return "C" } break;
		case ord("V"): { return "V" } break;
		case ord("B"): { return "B" } break;
		case ord("N"): { return "N" } break;
		case ord("M"): { return "M" } break;
//		case ord(","): { return "," } break;
//		case ord("."): { return "." } break;
//		case ord("/"): { return "/" } break;
		case vk_up: { return "Up" } break;
		case vk_numpad1: { return "Num 1" } break;
		case vk_numpad2: { return "Num 2" } break;
		case vk_numpad3: { return "Num 3" } break;
		case vk_control: { return "Control" } break;
		case vk_alt: { return "Alt" } break;
		case vk_space: { return "Space" } break;
		case vk_left: { return "Left" } break;
		case vk_right: { return "Right" } break;
		case vk_down: { return "Down" } break;
		case vk_numpad0: { return "Num 0" } break;
	}
}
	
function metronome_set(beats_per_minute,mu)
{
	with obj_metronome
	{
		bpm = beats_per_minute
		beat_ms = (60000000/(beats_per_minute*4))// / audio_sound_get_pitch(mu)
	}
}

function do_chancehit(chance) {
	var c = irandom_range(1,chance)
	if c = chance
		audio_play_sound(choose(sfx_chancehit1,sfx_chancehit2,sfx_chancehit3,sfx_chancehit4,sfx_chancehit5,sfx_chancehit6,sfx_chancehit7,sfx_chancehit8),1,0)
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
		
		if keyboard_check_pressed(cont_attack) || gamepad_button_check_pressed(controllerbind,gp_face3) || gamepad_button_check_pressed(controllerbind,gp_face2)
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
		
		if keyboard_check_pressed(cont_attack) || gamepad_button_check_pressed(controllerbind,gp_face3) || gamepad_button_check_pressed(controllerbind,gp_face2) || inputqueue_attack
			key_attack_press = 1
		if keyboard_check(cont_attack) || gamepad_button_check(controllerbind,gp_face3) || gamepad_button_check(controllerbind,gp_face2) || inputqueue_attack
			key_attack = 1
		else
			key_attack = 0
		
		if keyboard_check_pressed(cont_taunt) || gamepad_button_check_pressed(controllerbind,gp_face4) || inputqueue_taunt
			key_taunt_press = 1
		if keyboard_check(cont_taunt) || gamepad_button_check(controllerbind,gp_face4) || inputqueue_taunt
			key_taunt = 1
		else
			key_taunt = 0
		
		inputqueue_left = 0
		inputqueue_right = 0
		inputqueue_up = 0
		inputqueue_down = 0
		inputqueue_jump = 0
		inputqueue_attack = 0
		inputqueue_taunt = 0
	}
	if keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(controllerbind,gp_start)
		key_pause_press = 1
	if keyboard_check(vk_escape) || gamepad_button_check(controllerbind,gp_start)
		key_pause = 1
	else
		key_pause = 0
}

function player_velocity()
{
	if grav = 1
	{
		if vspeed < 15
			vspeed += 0.3
	}
	else
	{
		if vspeed > -15
			vspeed -= 0.3
	}
}

#endregion

#region compatability

function texture_set_interpolation_ext(argument0, argument1) {
	gpu_set_texfilter_ext(argument0, argument1)
}

#endregion

#region enemy

function enemy_boost_hit()
{
	instance_destroy()
	do_chancehit(5)
	var h = hspeed
	var s = spr_dead
		with instance_create_depth(x,y,other.depth + 1,obj_eatenapple)
		{
			popout = 0.02
			sprite_index = s
			vspeed = random_range(-5,-7)
			hspeed = obj_player.hspeed + h
			effect = 1
			rot_speed = 15
		}
	audio_play_sound(sfx_schlap,1,0)
	do_hitstun(5)
	instance_create_depth(mean(x,obj_player.x),mean(y,obj_player.y),depth - 1,obj_hitstuneffect)
	obj_hud.combotimer = 180
	score += 20 * (obj_player.combo + 1)
	obj_player.combo += 1
	ds_list_set(destroy_list,id,1)
}

#endregion
