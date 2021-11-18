var s = sprite_index
instance_destroy()
with instance_create_depth(x,y,-1,obj_eatenapple)
{
	switch s {
		case spr_apple: { sprite_index = spr_appleeaten } break;
		case spr_popsiclecol: { sprite_index = spr_popsiclecol_eaten } break;
		case spr_cracker: { sprite_index = spr_cracker_eaten } break;
	}
}
audio_play_sound(sfx_applemunch,1,0)
ds_list_set(destroy_list,id,1)
score += 10 * clamp(other.combo / 2,1,9999)