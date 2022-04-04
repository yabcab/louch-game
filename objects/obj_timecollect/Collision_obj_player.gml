if is_timetrial && !collected
{
	var s = sprite_index
	collected = 1
	with obj_timer
	{
		//seconds += 2
		//if seconds > 59
		//{
		//	seconds -= 60
		//	minutes += 1	
		//}
		with obj_timer
		{
			trial_timeleft += 6.5
			trial_timeleft = clamp(trial_timeleft,0,215)
		}
	}
	//NEW FX LATER
	//with instance_create_depth(x,y,-1,obj_eatenapple)
	//{
	//	switch s {
	//		case spr_apple: { sprite_index = spr_appleeaten } break;
	//		case spr_popsiclecol: { sprite_index = spr_popsiclecol_eaten } break;
	//		case spr_cracker: { sprite_index = spr_cracker_eaten } break;
	//	}
	//}
	var snd = audio_play_sound(sfx_tick,1,0)
	audio_sound_pitch(snd,random_range(0.7,1.3))
	ds_list_set(destroy_list,id,1)
	score += clamp(5 * clamp((other.combo + 1) / 2,1,9999),0,30)
}