//var s = sprite_index
//instance_destroy()
//with instance_create_depth(x,y,-1,obj_eatenapple)
//{
//	switch s {
//		case spr_apple: { sprite_index = spr_appleeaten } break;
//		case spr_popsiclecol: { sprite_index = spr_popsiclecol_eaten } break;
//		case spr_cracker: { sprite_index = spr_cracker_eaten } break;
//	}
//}

if !collected
{
	collected = 1
	var snd = audio_play_sound(sfx_crowncollect,1,0)
	audio_sound_pitch(snd,1 + ((crowncollects / crowncollecttotal) / 1.5))
	crowncollects++
	ds_list_set(destroy_list,id,1)
	score += 250
	instance_create_depth(x,y,-10,obj_crowncollectoutof)
	//ini_open("savedata.lmao")
	//ini_write_real("crowncollects_" + string(level),cid,1)
	//ini_close()
	crownarray[cid] = 1
	if !precollect
		totalcrowns++
}