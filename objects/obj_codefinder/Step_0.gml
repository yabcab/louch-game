var str = keyboard_string

if string_pos("catsing",str) > 0
{
	//obj_music.mu = mu_thatcatecansing
	campaign = 5
	keyboard_string = ""
}

if string_pos("thevoidisnow",str) > 0
{
	void = 1
	//if layer_exists("Background")
	//	layer_destroy(layer_get_id("Background"))
	while instance_exists(obj_parallax)
		instance_destroy(obj_parallax)
	while instance_exists(obj_parallax_nontiled)
		instance_destroy(obj_parallax_nontiled)
	while instance_exists(obj_parallax_title)
		instance_destroy(obj_parallax_title)
	keyboard_string = ""
}

//if string_pos("thevoidisnow",str) > 0
//{
//	if layer_exists("Background")
//		layer_destroy(layer_get_id("Background"))
//	keyboard_string = ""
//}

if string_pos("diablosauce",str) > 0
{
	campaign = 1
	keyboard_string = ""
}

if string_pos("louchester",str) > 0
{
	campaign = 2
	keyboard_string = ""
}

if string_pos("nolardass",str) > 0
{
	campaign = 4
	keyboard_string = ""
	//obj_music.mu = mu_nolard
}

if string_pos("lookatme",str) > 0
{
	if instance_exists(obj_player)
	{
		obj_player.state = playerstate.taunt
		obj_player.statesave = obj_player.state
		obj_player.sprite_index = spr_playerLS_taunt2
	}
	obj_music.mu = sfx_none
	keyboard_string = ""
}

if string_pos("yeahfuckyoutoo",str) > 0
{
	show_error("lmao",0)
	keyboard_string = ""
}

if string_pos("thermonuclearbomb",str) > 0
{
	with obj_player {
		state = playerstate.dying
		hspeed = random_range(10,15) * (facing * -1)
		vspeed = random_range(-13,-18)
		audio_play_sound(sfx_ricochet,1,0)
	}
	keyboard_string = ""
}

if string_pos("abandonment",str) > 0
{
	while instance_exists(obj_popsicle)
		instance_destroy(obj_popsicle)
	while instance_exists(obj_gonk)
		instance_destroy(obj_gonk)
	while instance_exists(obj_bella)
		instance_destroy(obj_bella)
	while instance_exists(obj_weed)
		instance_destroy(obj_weed)
	while instance_exists(obj_burningshmello)
		instance_destroy(obj_burningshmello)
	while instance_exists(obj_chocopop)
		instance_destroy(obj_chocopop)
	while instance_exists(obj_spacefeesh)
		instance_destroy(obj_spacefeesh)
	keyboard_string = ""
}

if string_pos("rodent",str) > 0
{
	with instance_create_depth(x,y,1,obj_thudthing)
		sprite_index = spr_rodent
	keyboard_string = ""
}

if string_pos("showmethematrix",str) > 0
{
	colview = 1
	audio_play_sound(sfx_thud,1,0)
	keyboard_string = ""
}