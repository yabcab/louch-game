var str = keyboard_string

if string_pos("catsing",str) > 0
{
	obj_music.mu = mu_thatcatecansing
	campaign = 5
	keyboard_string = ""
}

if string_pos("thevoidisnow",str) > 0
{
	if layer_exists("Background")
		layer_destroy(layer_get_id("Background"))
	keyboard_string = ""
}

if string_pos("thevoidisnow",str) > 0
{
	if layer_exists("Background")
		layer_destroy(layer_get_id("Background"))
	keyboard_string = ""
}

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
}

if string_pos("lookatme",str) > 0
{
	if instance_exists(obj_player)
	{
		obj_player.state = playerstate.taunt
		obj_player.statesave = obj_player.state
		obj_player.sprite_index = spr_playerLS_taunt2
	}
	obj_music.mu = mu_disclaimer
	keyboard_string = ""
}

if string_pos("yeahfuckyoutoo",str) > 0
{
	show_error("lmao",0)
	keyboard_string = ""
}

if string_pos("thermonuclearbomb",str) > 0
{
	if instance_exists(obj_player)
	{
		instance_destroy(obj_player)
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